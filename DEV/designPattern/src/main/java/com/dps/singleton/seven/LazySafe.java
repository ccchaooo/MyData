package com.dps.singleton.seven;

/**
 * @author dengchao
 * @date 2018/12/16 20:38
 * 懒汉模式 - 线程安全
 * 这种写法能够在多线程中很好的工作，而且看起来它也具备很好的lazy loading，但是，遗憾的是，效率很低，99%情况下不需要同步。
 */
public class LazySafe {
    private static LazySafe instance;
    private LazySafe(){}
    public static synchronized LazySafe getInstance() {
        if (instance == null) {
            instance = new LazySafe();
        }
        return instance;
    }
}