package com.example.demo.WebConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private RolAdministrador rolAdministrador;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(rolAdministrador)
                .addPathPatterns("/gestion/**");
    }
}
