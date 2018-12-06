package com.dps.adapter.adapterclass;

/**
 * @author dengchao
 * @date 2018/12/6 15:39
 * 适配器角色Adapter扩展了Adaptee,同时又实现了目标(Target)接口。
 * 由于Adaptee没有提供 targetSelfMethod()方法，而目标接口又要求这个方法，因此适配器角色Adapter实现了这个方法。
 */
public class Adapter extends Adaptee implements Target {
    /**
     * 由于源类Adaptee没有方法targetSelfMethod()
     * 因此适配器补充上这个方法
     */
    @Override
    public void targetSelfMethod() {
        //写相关的代码
    }

}