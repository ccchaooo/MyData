package com.dps.proxy.cglib;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 15:26
 * cglib代理,目标对象无须实现某一接口
 */
@Service
public class Target {
    public void sing() {
        System.out.println("执行目标对象的方法");
    }
}
