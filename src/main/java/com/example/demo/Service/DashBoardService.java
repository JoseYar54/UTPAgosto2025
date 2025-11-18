package com.example.demo.Service;

import com.example.demo.Model.Venta;

import java.util.List;

public interface DashBoardService {

    public List<Venta> ventaPorMes(int mes, int anio);
}
