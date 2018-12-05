package com.dps.factory.abfactory.product;

import com.dps.factory.abfactory.Keboy;

/**
 * @author dengchao
 * @date 2018/12/5 14:34
 */
public class DellKeboy implements Keboy {
    @Override
    public String sayHi() {
        return "生产了戴尔键盘";
    }
}
