package com.dps.strategy.impl;

import com.dps.strategy.Strategy;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/28 11:31
 */
@Service
public class StrategyImplA implements Strategy {
    @Override
    public void strategyInterface() {
        System.out.println(this.getClass().getName());
    }
}
