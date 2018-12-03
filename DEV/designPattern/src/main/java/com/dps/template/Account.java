package com.dps.template;

/**
 * @author dengchao
 * @date 2018/12/3 11:26
 * 抽象模板角色类
 */
public abstract class Account {
    /**
     * 模板方法，计算利息数额
     * 仅能被外部调用,不能被重写
     * @return    返回利息数额
     */
    public final double calculateInterest(){
        //账户类型
        String accountType = doCalculateAccountType();
        //利率
        double interestRate = doCalculateInterestRate();
        //总额
        double amount = calculateAmount(accountType);

        return amount * interestRate;
    }
    /**
     * 基本方法留给子类实现
     * @return 返回账户类型
     */
    protected abstract String doCalculateAccountType();
    /**
     * 基本方法留给子类实现
     * @return 返回计算出来的利息
     */
    protected abstract double doCalculateInterestRate();
    /**
     * 基本方法，已经实现
     * 内部逻辑
     */
    private double calculateAmount(String accountType){
        /**
         * 省略相关的业务逻辑
         */
        return 7243.00;
    }
}
