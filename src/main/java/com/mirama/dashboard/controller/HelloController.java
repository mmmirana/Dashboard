package com.mirama.dashboard.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping
public class HelloController {

    @Value("${server.port}")
    private String port;

    @GetMapping({"", "/hello"})
    public Map<String, Object> hello(@RequestParam(defaultValue = "dashboard") String key) {
        Map<String, Object> result = new HashMap<>();
        result.put("port", port);
        result.put("msg", String.format("hello %s", key));
        return result;
    }
}
