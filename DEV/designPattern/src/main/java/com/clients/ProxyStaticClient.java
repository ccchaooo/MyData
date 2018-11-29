package com.clients;

import com.dps.proxy.staticproxy.Proxy;
import com.dps.proxy.staticproxy.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 10:03
 */
@Service
public class ProxyStaticClient implements Client {
    @Autowired
    Subject realSubject;

    /**
     * @param realSubject 委托类
     * 根据委托类生成代理类
     */
    public Subject getProxy(Subject realSubject) {
        return new Proxy(realSubject) ;
    }

    public void clientInterface() {
        getProxy(realSubject).request();
    }
}
