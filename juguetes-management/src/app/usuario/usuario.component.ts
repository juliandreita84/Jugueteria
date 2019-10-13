import { Component, OnInit } from '@angular/core';
import { HttpClientService, Usuario } from '../service/http-client.service';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.component.html',
  styleUrls: ['./usuario.component.css']
})
export class UsuarioComponent implements OnInit {

  usuarios:Usuario[];
   
  constructor(
    private httpClientService:HttpClientService
  ) { }

  ngOnInit() {
    this.httpClientService.getUsuarios().subscribe(
     response =>this.handleSuccessfulResponse(response),
    );
  }

handleSuccessfulResponse(response)
{
    this.usuarios=response;
}

deleteUsuario(usuario: Usuario): void {
  this.httpClientService.deleteUsuario(usuario)
    .subscribe( data => {
      this.usuarios = this.usuarios.filter(u => u !== usuario);
    })
};

}