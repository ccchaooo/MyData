package com.clients;

import com.dps.observer.pull.ConcreteSubject;
import com.dps.observer.pull.Observer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author dengchao
 * @date 2018/12/4 10:36
 */
@Service
public class ObserverPullClient implements Client {
    @Autowired
    Observer pullObserver;
    @Autowired
    ConcreteSubject pullSubject;

    public void clientInterface() {
        pullSubject.attach(pullObserver);
        pullSubject. change((new Date()).toLocaleString());
    }

}
