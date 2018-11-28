package com.clients;

import com.dps.strategy.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/28 11:37
 */
@Service
public class StrategyClient implements Client{
    @Autowired
    Context context;

    public String clientInterface(int pram) {

        return context.contextInterface(pram);
    }
}
