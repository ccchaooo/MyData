package com.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author dengchao
 * @date 2018/11/28 10:56
 * @description
 */
@RestController
public class MyRestController {
    @RequestMapping(value = "/home")
    public String home() {
        return "welcome home!";
    }
}
