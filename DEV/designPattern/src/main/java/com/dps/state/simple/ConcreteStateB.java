package com.dps.state.simple;

/**
 * @author dengchao
 * @date 2018/12/5 16:35
 */
public class ConcreteStateB implements State {
    @Override
    public void handle(String sampleParameter) {
        System.out.println(this.getClass().getName()+"handle ：" + sampleParameter);
    }
}
