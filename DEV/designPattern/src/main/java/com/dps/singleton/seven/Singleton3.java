package com.dps.singleton.seven;

/**
 * @author dengchao
 * @date 2018/12/16 21:04
 * 饿汉模式
 * 这种方式基于classloder机制避免了多线程的同步问题，
 * 不过，instance在类装载时就实例化
 */
public class Singleton3 {
    private static Singleton3 instance = new Singleton3();
    private Singleton3(){}
    public static Singleton3 getInstance() {
        return instance;
    }
}
