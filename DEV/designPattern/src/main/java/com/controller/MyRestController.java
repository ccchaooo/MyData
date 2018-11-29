package com.controller;
import com.clients.*;
import com.dps.decorator.ConcretComponent;
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
    StrategyClient strategyClient;
    @RequestMapping(value = "/Strategy",method = RequestMethod.GET)
    public String strategy(@RequestParam(value = "num", required = false,defaultValue = "0") String prama) {
        return strategyClient.clientInterface(Integer.parseInt(prama));
    }


    @Autowired
    DecoratorClient decoratorClient;
    @Autowired
    ConcretComponent concretComponent;
    @RequestMapping(value = "/Decorator",method = RequestMethod.GET)
    public void decorator() {
        decoratorClient.clientInterface(concretComponent);
    }


    @Autowired
    ProxyStaticClient proxyStaticClient;
    @RequestMapping(value = "/StaticProxy",method = RequestMethod.GET)
    public void StaticProxy() {
        proxyStaticClient.clientInterface();
    }

    @Autowired
    ProxyJdkClient proxyJdkClient;
    @RequestMapping(value = "/JdkProxy",method = RequestMethod.GET)
    public void JdkProxy() {
        proxyJdkClient.clientInterface();
    }

    @Autowired
    ProxyJdkAnonymousClient proxyJdkAnonymousClient;
    @RequestMapping(value = "/JdkAnonymous",method = RequestMethod.GET)
    public void JdkAnonymous() {
        proxyJdkAnonymousClient.clientInterface();
    }
}
