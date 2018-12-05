package com.dps.observer.pull;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 23:23
 */
@Service("pullObserver")
public class ConcreteObserver implements Observer {
    //观察者的状态
    private String observerState;

    @Override
    public void update(Subject subject) {
        /**
         * 更新观察者的状态，使其与目标的状态保持一致
         */
        observerState = ((ConcreteSubject)subject).getState();
        System.out.println("观察者状态为："+observerState);
    }

}
