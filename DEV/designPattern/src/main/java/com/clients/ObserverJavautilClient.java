package com.clients;

import com.dps.observer.javautil.Watched;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Observer;

/**
 * @author dengchao
 * @date 2018/12/4 10:36
 */
@Service
public class ObserverJavautilClient implements Client {
    @Autowired
    Observer watcher;
    @Autowired
    Watched watched;

    public void clientInterface() {
        watched.addObserver(watcher);
        watched.setData((new Date()).toLocaleString());
    }

}
