package com.mirama.dashboard.controller;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping
@Slf4j
public class HelloController {

    @Value("${server.port}")
    private String port;

    @GetMapping({"", "/hello"})
    public Map<String, Object> hello(@RequestParam(defaultValue = "dashboard") String key) {
        Map<String, Object> result = new HashMap<>();
        result.put("port", port);
        result.put("datetime", DateUtil.format(new Date(), DatePattern.NORM_DATETIME_MS_FORMAT));
        result.put("msg", String.format("hello %s", key));
        return result;
    }
}
