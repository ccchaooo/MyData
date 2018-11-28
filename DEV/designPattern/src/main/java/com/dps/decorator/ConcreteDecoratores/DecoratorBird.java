package com.dps.decorator.concretedecoratores;

import com.dps.decorator.Component;
import com.dps.decorator.Decorator;

import java.util.HashMap;
import java.util.Map;

/**
 * @author dengchao
 * @date 2018/11/28 16:16
 */
public class DecoratorBird extends Decorator{

    public DecoratorBird(Component component) {

        super(component);
    }

    @Override
    public void show(){

        super.show();

        System.out.println(this.getClass().getName()+":=> Bird");

    }
}
