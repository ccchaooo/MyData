package com.dps.decorator.ConcreteDecoratores;

import com.dps.decorator.Component;
import com.dps.decorator.Decorator;

import java.util.HashMap;
import java.util.Map;

/**
 * @author dengchao
 * @date 2018/11/28 16:16
 */
public class DecoratorDog extends Decorator{

    public DecoratorDog(Component component) {
        super(component);
    }
    @Override
    public Map<String,String> show(){

        super.show();

        System.out.println(this.getClass().getName());

        return new HashMap<String, String>(10);
    }
}
