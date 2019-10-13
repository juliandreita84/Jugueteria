package com.jugueteria.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jugueteria.modelo.Usuario;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class TestController {

	private List<Usuario> usuarios = createList();

	@RequestMapping(value = "/usuarios", method = RequestMethod.GET, produces = "application/json")
	public List<Usuario> firstPage() {
		return usuarios;
	}
	
	private static List<Usuario> createList() {
		List<Usuario> tempUsuarios = new ArrayList<>();
		Usuario usr1 = new Usuario();
		usr1.setNombre("andrea");
		usr1.setIdentificacion("53052249");
		usr1.setUsrId("1");
		usr1.setSalario(3000);

		Usuario usr2 = new Usuario();
		usr2.setNombre("gustavo");
		usr2.setIdentificacion("80101066");
		usr2.setUsrId("2");
		usr2.setSalario(3000);
		tempUsuarios.add(usr1);
		tempUsuarios.add(usr2);
		return tempUsuarios;
	}

}