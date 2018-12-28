package com.dps.flyweight;

/**
 * @author dengchao
 * @date 2018/12/28 10:34
 * 抽象享元角色类
 */


public interface Flyweight {
    /**
     * 一个示意性方法，参数state是外蕴状态
     * @param state
     */
    public void operation(String state);
}

