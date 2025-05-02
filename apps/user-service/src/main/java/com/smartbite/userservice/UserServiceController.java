package com.smartbite.userservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user-service")
public class UserServiceController {

    @GetMapping
    public String index() {
        return "Hello from user-service";
    }
}
