package com.dps.observer.push;

/**
 * @author dengchao
 * @date 2018/12/4 10:08
 * 抽象观察者角色类
 */
public interface Observer {
    /**
     * 更新接口
     * @param state    更新的状态
     */
    public void update(String state);
}
