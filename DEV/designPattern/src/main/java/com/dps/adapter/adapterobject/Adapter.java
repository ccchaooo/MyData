package com.dps.adapter.adapterobject;

/**
 * @author dengchao
 * @date 2018/12/6 15:55
 * 公共方法由Adapter委派
 */
public class Adapter {
    private Adaptee adaptee;

    public Adapter(Adaptee adaptee){
        this.adaptee = adaptee;
    }
    /**
     * 源类Adaptee有方法adapteeMethod
     * 因此适配器类直接委派即可
     */
    public void adapteeMethod(){
        this.adaptee.adapteeMethod();
    }
    /**
     * 源类Adaptee没有方法targetSelfMethod
     * 因此由适配器类需要补充此方法
     */
    public void targetSelfMethod(){
        //写相关的代码
    }
}