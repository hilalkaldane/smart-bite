package com.smartbite.menuservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu-service")
public class MenuServiceController {

    @GetMapping
    public String index() {
        return "Hello from menu-service";
    }
}
