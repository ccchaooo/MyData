package com.dps.observer.push;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 10:23
 * 具体通知者角色类
 */
@Service
public class ConcreteSubject extends Subject{

    private String state;

    public String getState() {
        return state;
    }

    public void change(String newState){
        state = newState;
        System.out.println("通知者状态为：" + state);
        //状态发生改变，通知各个观察者
        this.notify(state);
    }
}
