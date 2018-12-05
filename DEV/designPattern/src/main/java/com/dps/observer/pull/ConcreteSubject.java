package com.dps.observer.pull;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 23:25
 */
@Service("pullsubject")
public class ConcreteSubject extends Subject{

    private String state;

    public String getState() {
        return state;
    }

    public void change(String newState){
        state = newState;
        System.out.println("主题状态为：" + state);
        //状态发生改变，通知各个观察者(pull模型不需要在通知方法里传递参数,父类的notify会传引用)
        this.notifyObservers();
    }
}