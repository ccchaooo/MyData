package com.dps.proxy.dynamic.jdk.impl;

import com.dps.proxy.dynamic.jdk.ProxyJdkService;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 11:37
 */
@Service
public class UserProxyServiceImpl implements ProxyJdkService {
    @Override
    public void add() {
        System.out.println("This is add service");
    }
}
