package com.dps.singleton.seven;

/**
 * @author dengchao
 * @date 2018/12/16 20:38
 * 懒汉模式 - 线程不安全的
 */
public class LazyUnsafe {

    private static LazyUnsafe instance;

    private LazyUnsafe(){}

    public static LazyUnsafe getInstance(){
        if (instance == null){
            instance = new LazyUnsafe();
        }
        return instance;
    }

}
