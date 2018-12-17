package com.dps.singleton.seven;

/**
 * @author dengchao
 * @date 2018/12/16 21:06
 * 饿汉模式,与Singleton3类似
 */
public class Singleton4 {
    private static Singleton4 instance = null;
    static {
        instance = new Singleton4();
    }
    private Singleton4(){}
    public static Singleton4 getInstance() {
        return Singleton4.instance;
    }
}