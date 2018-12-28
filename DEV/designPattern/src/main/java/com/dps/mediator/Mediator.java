package com.dps.mediator;

/**
 * @author dengchao
 * @date 2018/12/27 11:46
 * 抽象Mediator,可以与同事们进行联络
 */
public abstract class Mediator {
    public abstract void contact(String content,Colleague coll);
}
