package com.smartbite.orderservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order-service")
public class OrderServiceController {

    @GetMapping
    public String index() {
        return "Hello from order-service";
    }
}
