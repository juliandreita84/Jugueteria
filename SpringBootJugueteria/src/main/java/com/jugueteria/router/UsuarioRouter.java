package com.jugueteria.router;

import org.apache.camel.builder.RouteBuilder;

public class UsuarioRouter extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        from("direct:select")
        .to("sqlComponent:{{sql.getAllUsuarios}}")
        .beanRef("usuarioMapper", "readUsuarios")
        .log("Consulta ejecutada");

//        from("direct:insert")
//        .log("Insertado nuevo usuario")
//        .beanRef("usuarioMapper", "getMap")
//        .to("sqlComponent:{{sql.insertUsuario}}");
    }

}