package com.dps.singleton.seven;

/**
 * @author dengchao
 * @date 2018/12/16 21:15
 * 双重校验锁
 */
public class Singleton7 {
    private volatile static Singleton7 instance;
    private Singleton7(){}
    public static Singleton7 getSingleton() {
        if (instance == null) {
            synchronized (Singleton7.class) {
                if (instance == null) {
                    instance = new Singleton7();
                }
            }
        }
        return instance;
    }
} 