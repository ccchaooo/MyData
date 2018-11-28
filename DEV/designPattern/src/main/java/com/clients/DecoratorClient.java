package com.clients;

import com.dps.decorator.Component;
import com.dps.decorator.ConcreteDecoratores.DecoratorBird;
import com.dps.decorator.ConcreteDecoratores.DecoratorDog;
import com.dps.decorator.ConcreteDecoratores.DecoratorFish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/28 16:25
 */
@Service
public class DecoratorClient implements Client {

    /**
     * 最终对象
     */
    private Component monkey;

    @Autowired
    public DecoratorClient(Component monkey) {
        this.monkey = new DecoratorDog(new DecoratorBird(new DecoratorFish(monkey)));
    }


    @Override
    public String clientInterface(int pram) {
        monkey.show();
        return "";
    }
}
