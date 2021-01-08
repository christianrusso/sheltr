export interface Users {
 id?: string;
 Nombre: string;
 Email: string;
 Imagen?: any;
 TipoUsuario: number;
}

export interface TipoUsuario {
    id: string;
    idUsuario: number;
    Descripcion: string;
}
