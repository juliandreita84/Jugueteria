import { Component, OnInit } from '@angular/core';
import { HttpClientService, Usuario } from '../service/http-client.service';

@Component({
  selector: 'app-add-usuario',
  templateUrl: './add-usuario.component.html',
  styleUrls: ['./add-usuario.component.css']
})
export class AddUsuarioComponent implements OnInit {

  user: Usuario = new Usuario("","","","");

  constructor(
    private httpClientService: HttpClientService
  ) { }

  ngOnInit() {
  }

  createUsuario(): void {
    this.httpClientService.createUsuario(this.user)
        .subscribe( data => {
          alert("Usuario creado con éxito.");
        });

  };

}