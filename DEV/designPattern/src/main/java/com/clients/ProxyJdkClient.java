package com.clients;

import com.dps.proxy.dynamic.jdk.MyInvocatioHandler;
import com.dps.proxy.dynamic.jdk.JdkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 10:03
 */
@Service
public class ProxyJdkClient implements Client {
    @Autowired
    JdkService myJdkService;

    /**
     * @param jdkService 委托类
     * 根据委托类生成代理类
     */
    public JdkService getProxy(JdkService jdkService) {
        MyInvocatioHandler handler = new MyInvocatioHandler(jdkService);
        return (JdkService)handler.getProxy();
    }

    public void clientInterface() {
        getProxy(myJdkService).add();
    }
}
