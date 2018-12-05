package com.dps.factory.abfactory.factory;

import com.dps.factory.abfactory.PcFactory;
import com.dps.factory.abfactory.product.HpKeboy;
import com.dps.factory.abfactory.product.HpMouse;
import com.dps.factory.abfactory.Keboy;
import com.dps.factory.abfactory.Mouse;

/**
 * @author dengchao
 * @date 2018/12/5 14:32
 */
public class HpFactory extends PcFactory {
    @Override
    public Mouse createMouse() {
        return new HpMouse();
    }

    @Override
    public Keboy createKeboy() {
        return new HpKeboy();
    }
}
