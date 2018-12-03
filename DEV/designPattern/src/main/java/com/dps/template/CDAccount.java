package com.dps.template;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:37
 * 具体模板角色类 CDA
 */
@Service("cDAccount")
public class CDAccount extends Account {

    /**
     * 钩子方法,由子类实现
     * @return 账户类型
     */
    @Override
    protected String doCalculateAccountType() {
        return "Certificate of Deposite";
    }

    /**
     * 钩子方法,由子类实现
     * @return 利率
     */
    @Override
    protected double doCalculateInterestRate() {
        return 0.06;
    }

}