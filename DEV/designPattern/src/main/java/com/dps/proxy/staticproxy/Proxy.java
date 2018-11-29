package com.dps.proxy.staticproxy;

/**
 * @author dengchao
 * @date 2018/11/29 09:56
 * 委托类
 */
public class Proxy implements Subject {

    /**
     * 持有有个委托类的引用
     */
    private Subject realSubject;

    public Proxy(Subject realSubject) {
        this.realSubject = realSubject;
    }

    /**
     * 代理方法
     */
    @Override
    public void request() {
        System.out.println("代理开始: " + this.getClass().getName());
        realSubject.request();
        System.out.println("代理结束: " + this.getClass().getName());
    }
}
