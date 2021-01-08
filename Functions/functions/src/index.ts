import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import {Storage} from '@google-cloud/storage';
import * as fs from 'fs-extra';
import * as paths from 'path';
import * as os from 'os';




admin.initializeApp(functions.config().firebase);

export const infoUser = functions.https.onRequest((request,response) => {
 admin.firestore().collection('Users').add({
    text:request.query.text
 }).then( res => {
    response.send(res);
 }).catch( err => {
     response.send(err);
 });
});

export const deleteUser = functions.firestore.document('Users/{userID}')
    .onDelete((snap, context) => {

      const deletedValue = snap.data(); 
      const deletedUser = admin.auth().deleteUser(deletedValue.id);
      console.log(deletedUser);
      console.log(deletedValue);     
      return deletedValue; 

    });

export const optimizeImages = functions.storage
.object()
.onFinalize(async object => {

   const fileBucket = object.bucket;
   const filePath = object.name;
   const contentType = object.contentType;
   const url = object.mediaLink;
   const store = new Storage();


   

   if(fileBucket && filePath && contentType) {

      if (!contentType.startsWith('image/')) {
         console.log('This is not an image.');
         return true;
       }

      const extendName = paths.extname(filePath);
      const fileName = paths.basename(filePath, extendName);
      const fileFullName = `${fileName}${extendName}`;

      if (fileName.includes('_thumb_')) {
      console.log('Already a Thumbnail.');
      return true;
      }
      const bucket = store.bucket(fileBucket);
      const file = bucket.file(filePath);

      const [data] = await file.getMetadata();
      if (data.metadata && data.metadata.optimized) {
      console.log('Image has been already optimized');
      return true;
      }
      
      const workingDir = paths.join(os.tmpdir(), 'thumbs');
      const destination = paths.join(workingDir, fileFullName);

      await fs.ensureDir(workingDir);
      await file.download({ destination });
      const bucketDir = paths.dirname(filePath);
      

      const sharp = require('sharp');
      const sizes = [480, 640, 1200];
      const resizesPromises = sizes.map((size) => {
      const thumbName = `${fileName}_thumb_${size}${extendName}`;
      const thumbPath = paths.join(workingDir, thumbName);
         return sharp(destination)
            .resize(size)
            .toFile(thumbPath);
         });
      await Promise.all(resizesPromises);
      console.log('generate 3 images per devices, done!');

      const imagemin = require('imagemin');
      const imageminPngquant = require('imagemin-pngquant');
      const imageminMozjpeg = require('imagemin-mozjpeg');
      
      await imagemin([`${workingDir}/*.{jpg,png}`], {
        destination: workingDir,
        plugins: [
          imageminPngquant({quality: [0.6, 0.6]}),
          imageminMozjpeg({quality: 60})
        ]
      });
      console.log('optimize jpg and png, done!');

      const files = await fs.readdir(workingDir);
      console.log(files);

      const uploadPromises = files.map(newfile => {
      const path = paths.join(workingDir, newfile);
      return bucket.upload(path, {
         destination: paths.join(bucketDir, paths.basename(newfile)),
         metadata: {
            metadata: {
            optimized: true
            }
         }
      });
      });
      await Promise.all(uploadPromises);
      console.log('upload images, done!');

      return fs.remove(workingDir);


   } else {
      console.log('imcomplete data');
      return false;
   }

  
});
