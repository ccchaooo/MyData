package com.dps.decorator.concretedecoratores;

import com.dps.decorator.Component;
import com.dps.decorator.Decorator;

/**
 * @author dengchao
 * @date 2018/11/28 16:16
 */
public class DecoratorFish extends Decorator{

    public DecoratorFish(Component component) {

        super(component);
    }

    @Override
    public void show(){

        super.show();

        System.out.println(this.getClass().getName()+":=> Fish");

    }
}
