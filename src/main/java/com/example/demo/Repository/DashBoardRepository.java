package com.example.demo.Repository;

import com.example.demo.Model.Venta;

import java.util.List;

public interface DashBoardRepository {

    public List<Venta> ventaPorMes(int mes, int anio);
}
