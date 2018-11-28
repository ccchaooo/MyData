package com.dps.strategy;

/**
 * 策略上下文
 * @author dengchao
 * @date 2018/11/28 11:16
 */
public class Context {

    /**
     *  持有一个策略类
     **/
    private Strategy strategy;

    /**
     * @param strategy 为策略类赋值
     **/
    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }


    /**
     * 策略方法
     * */
    public void contextInterface(){
        strategy.strategyInterface();
    }

}
