package com.example.demo.Service.Impl;

import com.example.demo.Model.Venta;
import com.example.demo.Repository.DAO.DashBoardDAO;
import com.example.demo.Service.DashBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashBoardServiceImpl implements DashBoardService {

    @Autowired
    private DashBoardDAO dashBoardDAO;

    @Override
    public List<Venta> ventaPorMes(int mes, int anio) {
        return dashBoardDAO.ventaPorMes(mes,anio);
    }
}
