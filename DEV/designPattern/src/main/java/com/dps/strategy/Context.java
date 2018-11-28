package com.dps.strategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 策略上下文
 * @author dengchao
 * @date 2018/11/28 11:16
 */
@Service
public class Context {

    private Strategy strategyImplA;

    private Strategy strategyImplB;

    private Strategy strategyImplC;


    /**
     * 使用构造器注入bean
     */
    @Autowired
    public Context(Strategy strategyImplA, Strategy strategyImplB, Strategy strategyImplC) {
        this.strategyImplA = strategyImplA;
        this.strategyImplB = strategyImplB;
        this.strategyImplC = strategyImplC;
    }


    /**

     *  持有一个策略类
     **/
    private Strategy strategy;


    /**
     * @param strategy 为策略类赋值
     **/
    private void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }


    /**
     * 策略方法:客户端统一调用的接口
     * @param num 客户端传入参数
     * */
    public String contextInterface(int num){
        //设置当前持有的策略实现类
        switch(num){
            case 1:
                setStrategy(strategyImplA);
                break;
            case 2:
                setStrategy(strategyImplB);
                break;
            case 3:
                setStrategy(strategyImplC);
                break;
            default:
                return "not matched ! " +
                        "<div>?num=1 => strategyImplA</div> " +
                        "<div>?num=2 => strategyImplB</div> " +
                        "<div>?num=3 => strategyImplC</div> ";
        }
        //调用当前持有的策略实现类的策略方法
        return strategy.strategyInterface();
    }

}
