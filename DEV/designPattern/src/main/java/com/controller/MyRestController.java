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
    public void staticProxy() {
        proxyStaticClient.clientInterface();
    }

    @Autowired
    ProxyJdkClient proxyJdkClient;
    @RequestMapping(value = "/JdkProxy",method = RequestMethod.GET)
    public void jdkProxy() {
        proxyJdkClient.clientInterface();
    }

    @Autowired
    ProxyJdkAnonymousClient proxyJdkAnonymousClient;
    @RequestMapping(value = "/JdkAnonymous",method = RequestMethod.GET)
    public void jdkAnonymous() {
        proxyJdkAnonymousClient.clientInterface();
    }

    @Autowired
    ProxyCglibClient proxyCglibClient;
    @RequestMapping(value = "/Cglib",method = RequestMethod.GET)
    public void cglib() {
        proxyCglibClient.clientInterface();
    }


    @Autowired
    FactoryMethodClient factoryMethodClient;
    @RequestMapping(value = "/factoryMethod",method = RequestMethod.GET)
    public String factoryMethod(@RequestParam(value = "type", required = false,defaultValue = "null") String type) {
        return factoryMethodClient.clientInterface(type);
    }


    @Autowired
    TemplateClient templateClient;
    @RequestMapping(value = "/template",method = RequestMethod.GET)
    public String template() {
        return templateClient.clientInterface();
    }


    @Autowired
    FacedClient facedClient;
    @RequestMapping(value = "/faced",method = RequestMethod.GET)
    public void faced() {
        facedClient.clientInterface();
    }

    @Autowired
    BuilderClient builderClient;
    @RequestMapping(value = "/builder",method = RequestMethod.GET)
    public String builder() {
        return builderClient.clientInterface();
    }

    @Autowired
    ObserverClient observerClient;
    @RequestMapping(value = "/observer",method = RequestMethod.GET)
    public void observer() {
        observerClient.clientInterface();
    }
}