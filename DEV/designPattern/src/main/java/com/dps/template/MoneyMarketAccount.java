package com.dps.template;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:29
 * 具体模板角色类 MoneyMarket
 */
@Service("moneyMarketAccount")
public class MoneyMarketAccount extends Account {

    /**
     * 钩子方法,由子类实现
     * @return 账户类型
     */
    @Override
    protected String doCalculateAccountType() {

        return "Money Market";
    }

    /**
     * 钩子方法,由子类实现
     * @return 利率
     */
    @Override
    protected double doCalculateInterestRate() {

        return 0.045;
    }

}