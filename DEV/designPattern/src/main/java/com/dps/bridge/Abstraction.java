package com.dps.bridge;

/**
 * @author dengchao
 * @date 2018/12/18 11:23
 * 抽象化角色类
 */
public abstract class Abstraction {

    /**
     * 持有一个实现化对象的引用
     */
    protected Implementor impl;

    /**
     * @param impl 使用实现化对象来初始化抽象化对象
     */
    public Abstraction(Implementor impl){
        this.impl = impl;
    }

    /**
     * 声明了一个方法operation(),并给出了它的实现
     */
    public void operation(){

        //这个实现是通过向实现化对象的委派(调用operationImpl()方法)实现的
        impl.operationImpl();
    }
}