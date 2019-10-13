import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

export class Usuario{
  constructor(
    public usrId:string,
    public nombre:string,
    public identificacion:string,
    public salario:string,
  ) {}
}

@Injectable({
  providedIn: 'root'
})
export class HttpClientService {

  constructor(
    private httpClient:HttpClient
  ) { 
     }

     getUsuarios()
  {
    console.log("test call");
    return this.httpClient.get<Usuario[]>('http://localhost:8080/usuarios');
  }

  public deleteUsuario(usuario) {
    return this.httpClient.delete<Usuario>("http://localhost:8080/usuarios" + "/"+ usuario.usrId);
  }

  public createUsuario(usuario) {
    return this.httpClient.post<Usuario>("http://localhost:8080/usuarios", usuario);
  }
}