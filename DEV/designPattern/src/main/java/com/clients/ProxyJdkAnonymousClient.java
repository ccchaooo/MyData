package com.clients;

import com.dps.proxy.dynamic.jdkanonymous.Subject;
import com.dps.proxy.dynamic.jdkanonymous.JdkProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 10:03
 */
@Service
public class ProxyJdkAnonymousClient implements Client {
    @Autowired
    Subject subjectImpl;

    @Autowired
    JdkProxy jdkProxy;
    /**
     * @param subjectImpl 委托类
     * 根据委托类生成代理类
     */
    public Subject getProxy(Subject subjectImpl) {
        jdkProxy.setProxy(subjectImpl);
        return jdkProxy.getProxy();
    }

    public void clientInterface() {
        getProxy(subjectImpl).sing();
        getProxy(subjectImpl).talk();
    }
}
