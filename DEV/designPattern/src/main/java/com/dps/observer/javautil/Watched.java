package com.dps.observer.javautil;

import org.springframework.stereotype.Service;

import java.util.Observable;

/**
 * @author dengchao
 * @date 2018/12/5 10:50
 * 主题类(被观察者)Observable 由java.util提供
 */
@Service
public class Watched extends Observable {

        private String data = "";

        public String getData() {
            return data;
        }

        public void setData(String data) {

            if(!this.data.equals(data)){
                this.data = data;
                setChanged();
            }
            notifyObservers();
        }

}
