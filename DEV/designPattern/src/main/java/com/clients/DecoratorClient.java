package com.clients;

import com.dps.decorator.Component;
import com.dps.decorator.concretedecoratores.DecoratorBird;
import com.dps.decorator.concretedecoratores.DecoratorDog;
import com.dps.decorator.concretedecoratores.DecoratorFish;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/28 16:25
 */
@Service
public class DecoratorClient implements Client {

    /**
     * 被装饰的对象
     */
    private Component monkey;


    /**
     * (如果有需要,可多种装饰后的产品)
     * @param monkey
     */
    private void setMonkey(Component monkey) {
        this.monkey = new DecoratorFish(new DecoratorDog(new DecoratorBird(monkey)));
    }


    public void clientInterface(Component component) {
        setMonkey(component);
        System.out.println("调用初始接口 => ");
        monkey.show();
    }
}
