package com.controller;
import com.clients.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author dengchao
 * @date 2018/11/28 10:56
 * @description
 */
@RestController
public class MyRestController{
    @Autowired
    Client strategyClient;
    @RequestMapping(value = "/Strategy",method = RequestMethod.GET)
    public String strategy(@RequestParam(value = "num", required = false,defaultValue = "0") String prama) {
        return strategyClient.clientInterface(Integer.parseInt(prama));
    }

    @Autowired
    Client decoratorClient ;
    @RequestMapping(value = "/Decorator",method = RequestMethod.GET)
    public String decorator(@RequestParam(value = "name", required = false,defaultValue = "0") String prama) {
        return decoratorClient.clientInterface(Integer.parseInt(prama));
    }
}
