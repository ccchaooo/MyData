package com.dps.state.simple;

/**
 * @author dengchao
 * @date 2018/12/5 16:34
 * 环境类,用于设置调用条件
 */
public class Context {
    /**
     * 持有一个State类型的对象实例
     */
    private State state;

    public void setState(State state) {
        this.state = state;
    }
    /**
     * 用户感兴趣的接口方法
     */
    public void request(String sampleParameter) {
        //转调state来处理
        state.handle(sampleParameter);
    }
}