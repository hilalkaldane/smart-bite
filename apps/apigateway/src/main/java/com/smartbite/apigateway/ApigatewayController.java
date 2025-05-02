package com.smartbite.apigateway;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/apigateway")
public class ApigatewayController {

    @GetMapping
    public String index() {
        return "Hello from apigateway";
    }
}
