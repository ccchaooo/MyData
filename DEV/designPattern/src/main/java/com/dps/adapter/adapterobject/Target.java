package com.dps.adapter.adapterobject;

/**
 * @author dengchao
 * @date 2018/12/6 15:53
 */
public interface Target {
    /**
     * 这是源类Adaptee也有的方法
     */
    public void adapteeMethod();
    /**
     * 这是源类Adapteee没有的方法
     */
    public void targetSelfMethod();
}