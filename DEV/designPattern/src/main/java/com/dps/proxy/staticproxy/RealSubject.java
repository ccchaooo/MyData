package com.dps.proxy.staticproxy;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 09:54
 * 委托类
 */
@Service
public class RealSubject implements Subject {
    @Override
    public void request() {
        System.out.println("委托类: " + this.getClass().getName());
    }
}
