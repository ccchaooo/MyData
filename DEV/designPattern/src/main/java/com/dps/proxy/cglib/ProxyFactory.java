package com.dps.proxy.cglib;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

/**
 * @author dengchao
 * @date 2018/11/29 15:29
 * Cglib子类代理工厂
 */
public class ProxyFactory implements MethodInterceptor {
    /**
     * 维护目标对象
     */
    private Object target;

    public ProxyFactory(Object target) {
        this.target = target;
    }

    /**
     * @return 给目标对象创建一个代理对象
     */
    public Object getProxyInstance(){
        //1.工具类
        Enhancer en = new Enhancer();
        //2.设置父类
        en.setSuperclass(target.getClass());
        //3.设置回调函数
        en.setCallback(this);
        //4.创建子类(代理对象)
        return en.create();
    }

    @Override
    public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {

        System.out.println("开始对 " + method.getName() + " 进行代理");

        //执行目标对象的方法
        Object returnValue = method.invoke(target, args);

        /*-- 此处可以对方法进行属性的修改 --*/

        System.out.println("对 " + method.getName() + " 的代理已完成!");

        return returnValue;
    }
}
