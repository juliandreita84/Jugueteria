package com.jugueteria.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jugueteria.modelo.Usuario;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping({ "/usuarios" })
public class TestController {

	private List<Usuario> usuarios = createList();

	@GetMapping(produces = "application/json")
	public List<Usuario> firstPage() {
		return usuarios;
	}
	
	@DeleteMapping(path = { "/{id}" })
	public Usuario delete(@PathVariable("id") int id) {
		Usuario deletedUsr = null;
		for (Usuario usr : usuarios) {
			if (usr.getUsrId().equals(id)) {
				usuarios.remove(usr);
				deletedUsr = usr;
				break;
			}
		}
		return deletedUsr;
	}

	@PostMapping
	public Usuario create(@RequestBody Usuario user) {
		usuarios.add(user);
		System.out.println(usuarios);
		return user;
	}
	
	private static List<Usuario> createList() {
		List<Usuario> tempUsuarios = new ArrayList<>();
		Usuario usr1 = new Usuario();
		usr1.setNombre("andrea");
		usr1.setIdentificacion("1001315588");
		usr1.setUsrId("1");
		usr1.setSalario(3000);

		Usuario usr2 = new Usuario();
		usr2.setNombre("jennifer");
		usr2.setIdentificacion("1001315589");
		usr2.setUsrId("2");
		usr2.setSalario(3000);
		tempUsuarios.add(usr1);
		tempUsuarios.add(usr2);
		return tempUsuarios;
	}

}