package com.jugueteria.util;

import com.jugueteria.modelo.Usuario;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsuarioMapper {

    public Map<String, Object> getMap(Usuario usuario) {
        Map<String, Object> answer = new HashMap<String, Object>();
        answer.put("Nombre", usuario.getNombre());
        answer.put("Identificacion", usuario.getIdentificacion());
        return answer;
    }

    public List<Usuario> readUsuarios(List<Map<String, String>> dataList) {

        System.out.println("data:" + dataList);

        List<Usuario> usuarios = new ArrayList<Usuario>();

        for (Map<String, String> data : dataList) {

        	Usuario usuario = new Usuario();

        	usuario.setNombre(data.get("Nombre"));
        	usuario.setIdentificacion(data.get("Identificacion"));

        	usuarios.add(usuario);
        }

        return usuarios;
    }
}