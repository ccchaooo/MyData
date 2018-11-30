package com.dps.strategy.strategyimpl;

import com.dps.strategy.Strategy;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/28 11:31
 */
@Service
public class StrategyImplB implements Strategy {
    @Override
    public String strategyInterface() {
        return "当前访问类: " + this.getClass().getName();
    }
}
