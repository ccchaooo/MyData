package com.clients;

import com.dps.proxy.dynamic.jdk.MyInvocatioHandler;
import com.dps.proxy.dynamic.jdk.ProxyJdkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 10:03
 */
@Service
public class ProxyJdkClient implements Client {
    @Autowired
    ProxyJdkService myProxyJdkService;

    /**
     * @param proxyJdkService 委托类
     * 根据委托类生成代理类
     */
    public ProxyJdkService getProxy(ProxyJdkService proxyJdkService) {
        MyInvocatioHandler handler = new MyInvocatioHandler(proxyJdkService);
        return (ProxyJdkService)handler.getProxy();
    }

    public void clientInterface() {
        getProxy(myProxyJdkService).add();
    }
}
