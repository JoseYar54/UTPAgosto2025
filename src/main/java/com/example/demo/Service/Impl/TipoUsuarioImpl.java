package com.example.demo.Service.Impl;

import com.example.demo.Model.TipoUsuario;
import com.example.demo.Repository.DAO.TipoUsuarioDAO;
import com.example.demo.Service.TipoUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoUsuarioImpl implements TipoUsuarioService {

    private final TipoUsuarioDAO tipoUsuarioDAO;

    @Autowired
    public TipoUsuarioImpl(TipoUsuarioDAO tipoUsuarioDAO) {
        this.tipoUsuarioDAO = tipoUsuarioDAO;
    }

    @Override
    public List<TipoUsuario> obtenerTiposUsuario() {
        return tipoUsuarioDAO.obtenerTiposUsuario();
    }

    @Override
    public TipoUsuario obtenerTipoUsuarioPorId(int id) {
        return tipoUsuarioDAO.obtenerTipoUsuarioPorId(id);
    }

    @Override
    public void crearTipoUsuario(TipoUsuario tipoUsuario) {
        tipoUsuarioDAO.crearTipoUsuario(tipoUsuario);
    }

    @Override
    public void actualizarTipoUsuario(TipoUsuario tipoUsuario) {
        tipoUsuarioDAO.actualizarTipoUsuario(tipoUsuario);
    }

    @Override
    public void eliminarTipoUsuario(int id) {
        tipoUsuarioDAO.eliminarTipoUsuario(id);
    }
}
