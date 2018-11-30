package com.dps.proxy.dynamic.jdk;

/**
 * @author dengchao
 * @date 2018/11/29 11:35
 * JDK动态代理局限性:
 * 通过反射类Proxy和InvocationHandler回调接口实现的jdk动态代理，要求委托类必须实现一个接口。
 * 但事实上并不是所有类都有接口，对于没有实现接口的类，便无法使用该方方式实现动态代理。
 */
public interface JdkService {
    //目标方法
    void add();
}
