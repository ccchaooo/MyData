package com.clients;

import com.dps.proxy.cglib.ProxyFactory;
import com.dps.proxy.cglib.Target;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 10:03
 */
@Service
public class ProxyCglibClient implements Client {
    @Autowired
    Target target;

    /**
     * 根据委托类生成代理类
     */
    public Object getProxy() {
        return new ProxyFactory(target).getProxyInstance();
    }

    public void clientInterface() {
        ((Target)getProxy()).sing();
    }
}
