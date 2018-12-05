package com.clients;

import com.dps.observer.push.ConcreteSubject;
import com.dps.observer.push.Observer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/4 10:36
 */
@Service
public class ObserverPushClient implements Client {
    @Autowired
    Observer concreteObserver;
    @Autowired
    ConcreteSubject concreteSubject;

    public void clientInterface() {
        concreteSubject.attach(concreteObserver);
        concreteSubject. change("新状态");
    }

}
