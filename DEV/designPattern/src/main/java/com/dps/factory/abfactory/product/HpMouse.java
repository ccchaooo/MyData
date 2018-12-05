package com.dps.factory.abfactory.product;

import com.dps.factory.abfactory.Mouse;

/**
 * @author dengchao
 * @date 2018/12/5 14:35
 */
public class HpMouse implements Mouse {
    @Override
    public String sayHi() {
        return "生产了惠普鼠标";
    }
}
