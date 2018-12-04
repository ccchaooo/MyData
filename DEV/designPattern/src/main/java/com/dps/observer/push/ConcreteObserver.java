package com.dps.observer.push;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 10:21
 * 抽象通知者角色类
 */
@Service
public class ConcreteObserver implements Observer {
    //观察者的状态
    private String observerState;

    @Override
    public void update(String state) {
        /**
         * 更新观察者的状态，使其与目标的状态保持一致
         */
        observerState = state;
        System.out.println("观察者 " + this.getClass().getName() + " 状态为："+observerState);
    }

}
