package com.dps.adapter.adapterdefault;

/**
 * @author dengchao
 * @date 2018/12/6 16:07
 * 和尚要做什么呢？吃斋、念经、打坐、撞钟、习武等。
 * 如果设计一个和尚接口，给出所有的和尚都需要实现的方法，那么这个接口应当如下：
 */
public interface 和尚 {
    void 吃斋();
    void 念经();
    void 打坐();
    void 撞钟();
    void 习武();
    String getName();
}