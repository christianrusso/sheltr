

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sheltr/src/model/message.dart';
import 'package:sheltr/src/model/user.dart';
import 'package:sheltr/src/utilities/utils.dart';

class MessageService  with ChangeNotifier {

   

    static Stream<List<User>> getUsers() => Firestore.instance
      .collection('Users')
      // TODO: filtrar el ultimo mensaje
      //.orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(User.fromJson));

  static Future uploadMessage(String idUser, String message) async {
    final refMessages =
        Firestore.instance.collection('Chats/$idUser/messages');
      
      final _pref = PreferenciasUsuario();
      final user = User.fromJson(_pref.profile);
 
    final newMessage = Message(
      idUser: user.id,
      urlAvatar: user.imagen,
      username: user.nombre,
      message: message,
      createdAt: DateTime.now(),
    ); 
    await refMessages.add(newMessage.toJson());

    final refUsers = Firestore.instance.collection('Users');
    // await refUsers
    //     .document(idUser)
    //     .updateData({UserField.lastMessageTime: DateTime.now()});
    // TODO: actualiza el ultimo mensaje
    
  }

  static Stream<List<Message>> getMessages(String idUser) =>
      Firestore.instance
          .collection('Chats/$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<User> users) async {
    final refUsers = Firestore.instance.collection('Users');

    final allUsers = await refUsers.getDocuments();
    if (allUsers != null) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.document();
        final newUser = user.copyWith(id: userDoc.documentID);

        await userDoc.setData(newUser.toJson());
      }
    }
  }
}

