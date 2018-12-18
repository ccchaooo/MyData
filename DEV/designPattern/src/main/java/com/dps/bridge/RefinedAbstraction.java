package com.dps.bridge;

/**
 * @author dengchao
 * @date 2018/12/18 11:25
 * 修正抽象化角色
 */
public class RefinedAbstraction extends Abstraction {

    public RefinedAbstraction(Implementor impl) {
        super(impl);
    }

    /**
     * 其他的操作方法
     */
    public void otherOperation(){

    }
}
