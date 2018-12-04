package com.clients;

import com.dps.observer.ConcreteSubject;
import com.dps.observer.Observer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 10:36
 */
@Service
public class ObserverClient implements Client {
    @Autowired
    Observer concreteObserver;
    @Autowired
    ConcreteSubject concreteSubject;

    public void clientInterface() {
        concreteSubject.attach(concreteObserver);
        concreteSubject. change("新状态");
    }

}
