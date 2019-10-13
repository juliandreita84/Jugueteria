import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UsuarioComponent } from './usuario/usuario.component';
import { AddUsuarioComponent } from './add-usuario/add-usuario.component';


const routes: Routes = [
  { path:'', component: UsuarioComponent},
  { path:'addusuario', component: AddUsuarioComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
