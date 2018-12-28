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
    FactoryAbClient factoryAbClient;
    @RequestMapping(value = "/factoryAbClient",method = RequestMethod.GET)
    public String factoryAbClient(@RequestParam(value = "type", required = false,defaultValue = "DELL") String type)  {
        return factoryAbClient.clientInterface(type);
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
    ObserverPushClient observerPushClient;
    @RequestMapping(value = "/observerpush",method = RequestMethod.GET)
    public void observer() {
        observerPushClient.clientInterface();
    }

    @Autowired
    ObserverPullClient observerPullClient;
    @RequestMapping(value = "/observerpull",method = RequestMethod.GET)
    public void observerpull() {
        observerPullClient.clientInterface();
    }


    @Autowired
    ObserverJavautilClient observerJavautilClient;
    @RequestMapping(value = "/observerJavautil",method = RequestMethod.GET)
    public void observerJavautil() {
        observerJavautilClient.clientInterface();
    }


    @Autowired
    StateSimpleClient stateSimpleClient;
    @RequestMapping(value = "/stateSimple",method = RequestMethod.GET)
    public void stateSimple() {
        stateSimpleClient.clientInterface();
    }


    @Autowired
    StateVoteClient stateVoteClient;
    @RequestMapping(value = "/stateVote",method = RequestMethod.GET)
    public void stateVote() {
        stateVoteClient.clientInterface();
    }


    @Autowired
    MementoWhiteBoxClient mementoWhiteBoxClient;
    @RequestMapping(value = "/mementoWhiteBox",method = RequestMethod.GET)
    public void mementoWhiteBox() {
        mementoWhiteBoxClient.clientInterface();
    }

    @Autowired
    MementoMcpClient mementoMcpClient;
    @RequestMapping(value = "/mementoblackBox",method = RequestMethod.GET)
    public void mementoMcp() {
        mementoMcpClient.clientInterface();
    }

    @Autowired
    MementoSelfClient mementoSelfClient;
    @RequestMapping(value = "/mementoSelf",method = RequestMethod.GET)
    public void mementoSelf() {
        mementoSelfClient.clientInterface();
    }


    @Autowired
    ComponentSafeClient componentSafeClient;
    @RequestMapping(value = "/componentSafe",method = RequestMethod.GET)
    public void componentSafe() {
        componentSafeClient.clientInterface();
    }


    @Autowired
    ComponentTransparentClient componentTransparentClient;
    @RequestMapping(value = "/componentTransparent",method = RequestMethod.GET)
    public void componentTransparent() {
        componentTransparentClient.clientInterface();
    }


    @Autowired
    IteratorClient iteratorClient;
    @RequestMapping(value = "/iterator",method = RequestMethod.GET)
    public void iterator() {
        iteratorClient.clientInterface();
    }


    @Autowired
    BridgeClient bridgeClient;
    @RequestMapping(value = "/bridge",method = RequestMethod.GET)
    public void bridge() {
        bridgeClient.clientInterface();
    }


    @Autowired
    CommandClient commandClient;
    @RequestMapping(value = "/command",method = RequestMethod.GET)
    public void command() {
        commandClient.clientInterface();
    }

    @Autowired
    MediatorClient mediatorClient;
    @RequestMapping(value = "/mediator",method = RequestMethod.GET)
    public void chain() {
        mediatorClient.clientInterface();
    }

    @Autowired
    FlyweigthClient flyweigthClient;
    @RequestMapping(value = "/flyweigth",method = RequestMethod.GET)
    public void flyweigth() {
        flyweigthClient.clientInterface();
    }

    @Autowired
    VisiterMoziClient visiterMoziClient;
    @RequestMapping(value = "/visiterMozi",method = RequestMethod.GET)
    public void visiterMozi() {
        visiterMoziClient.clientInterface();
    }
}
