package com.dps.decorator;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 装饰类
 * @author dengchao
 * @date 2018/11/28 14:50
 */
public class Decorator implements Component {
    private Component component;

    @Autowired
    public Decorator(Component component) {

        this.component = component;

    }

    @Override
    public void show() {
        //委派给构建
        component.show();
    }
}
