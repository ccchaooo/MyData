package com.dps.observer.pull;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dengchao
 * @date 2018/12/4 10:08
 */
public abstract class Subject {
    /**
     * 用来保存注册的观察者对象
     */
    private    List<Observer> list = new ArrayList<Observer>();
    /**
     * 注册观察者对象
     * @param observer    观察者对象
     */
    public void attach(Observer observer){

        list.add(observer);
        System.out.println("Attached an observer");
    }
    /**
     * 删除观察者对象
     * @param observer    观察者对象
     */
    public void detach(Observer observer){

        list.remove(observer);
    }
    /**
     * 通知所有注册的观察者对象
     */
    public void notifyObservers(){

        for(Observer observer : list){
            //将自身引用传递给观察者,观察者如有需要可以获取更多信息

            observer.update(this);
        }
    }
}