package com.dps.observer.javautil;

import org.springframework.stereotype.Service;

import java.util.Observable;
import java.util.Observer;

/**
 * @author dengchao
 * @date 2018/12/5 10:51
 * 观察者Observer 由java.util提供
 */
@Service
public class Watcher implements Observer {

    public Watcher(Observable o){
        o.addObserver(this);
    }

    @Override
    public void update(Observable o, Object arg) {

        System.out.println("状态发生改变：" + ((Watched)o).getData());
    }

}
