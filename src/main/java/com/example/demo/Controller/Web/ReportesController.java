package com.example.demo.Controller.Web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gestion/reportes")
public class ReportesController {

    @GetMapping
    public String showReportsPage(){
        return "reportes";
    }
}
