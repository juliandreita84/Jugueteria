package com.jugueteria.controller;

import java.util.List;

import org.apache.camel.CamelContext;
import org.apache.camel.ProducerTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jugueteria.modelo.Usuario;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping({ "/usuarios" })
public class TestController {

//	private List<Usuario> usuarios = createList();

	ApplicationContext springCtx = new ClassPathXmlApplicationContext("/resources/application.xml");

	@Autowired
	CamelContext context = springCtx.getBean("usuarioContext", CamelContext.class);

	@GetMapping(produces = "application/json")
	public List<Usuario> firstPage() {
		List<Usuario> usuarios = null;
		try {
			context.start();

			ProducerTemplate producerTemplate = context.createProducerTemplate();

			// Get Usuario of inserted usuarios
			usuarios = producerTemplate.requestBody("direct:select", null, List.class);
			System.out.println("usuarios:" + usuarios);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuarios;
	}

//	@DeleteMapping(path = { "/{id}" })
//	public Usuario delete(@PathVariable("id") int id) {
//		Usuario deletedUsr = null;
//		for (Usuario usr : usuarios) {
//			if (usr.getUsrId().equals(id)) {
//				usuarios.remove(usr);
//				deletedUsr = usr;
//				break;
//			}
//		}
//		return deletedUsr;
//	}

	@PostMapping
	public Usuario create(@RequestBody Usuario user) {
		try {
			context.start();

			ProducerTemplate producerTemplate = context.createProducerTemplate();

			// Insert Usuario
			String resp = producerTemplate.requestBody("direct:insert", user, String.class);
//		usuarios.add(user);
//		System.out.println(usuarios);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

//	private static List<Usuario> createList() {
//		List<Usuario> tempUsuarios = new ArrayList<>();
//		Usuario usr1 = new Usuario();
//		usr1.setNombre("andrea");
//		usr1.setIdentificacion("1001315588");
//		usr1.setUsrId("1");
//		usr1.setSalario(3000);
//
//		Usuario usr2 = new Usuario();
//		usr2.setNombre("jennifer");
//		usr2.setIdentificacion("1001315589");
//		usr2.setUsrId("2");
//		usr2.setSalario(3000);
//		tempUsuarios.add(usr1);
//		tempUsuarios.add(usr2);
//		return tempUsuarios;
//	}

}