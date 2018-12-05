package com.dps.state.simple;

/**
 * @author dengchao
 * @date 2018/12/5 16:34
 * 抽象状态类
 */
public interface State {
    /**
     * 状态对应的处理
     */
    public void handle(String sampleParameter);
}
