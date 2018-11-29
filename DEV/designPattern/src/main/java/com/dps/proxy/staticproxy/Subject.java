package com.dps.proxy.staticproxy;

/**
 * @author dengchao
 * @date 2018/11/29 09:53
 * Subject 是委托类和代理类的接口
 *
 * 静态代理缺点：这种实现方式很直观也很简单，但其缺点是代理对象必须提前写出，
 * 如果接口层发生了变化，代理对象的代码也要进行维护。
 * 如果能在运行时动态地写出代理对象，不但减少了一大批代理类的代码，
 * 也少了不断维护的烦恼，不过运行时的效率必定受到影响。
 */
public interface Subject {
    void request();
}
