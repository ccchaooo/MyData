package com.dps.facade;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 14:50
 */
@Service
public class Facade {
    //示意方法，满足客户端需要的功能
    public void test(){
        ModuleA a = new ModuleA();
        a.testA();
        ModuleB b = new ModuleB();
        b.testB();
        ModuleC c = new ModuleC();
        c.testC();
    }
}
