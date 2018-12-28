package com.clients;

import com.dps.flyweight.Flyweight;
import com.dps.flyweight.FlyweightFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class FlyweigthClient implements Client {

    @Autowired
    FlyweightFactory flyweightFactory;

    public void clientInterface() {
        Flyweight fly = flyweightFactory.factory(new Character('a'));
        fly.operation("First Call");

        fly = flyweightFactory.factory(new Character('b'));
        fly.operation("Second Call");

        fly = flyweightFactory.factory(new Character('a'));
        fly.operation("Third Call");
    }
}
