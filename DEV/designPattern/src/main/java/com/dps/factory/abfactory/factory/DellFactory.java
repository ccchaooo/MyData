package com.dps.factory.abfactory.factory;

import com.dps.factory.abfactory.PcFactory;
import com.dps.factory.abfactory.Keboy;
import com.dps.factory.abfactory.Mouse;
import com.dps.factory.abfactory.product.DellKeboy;
import com.dps.factory.abfactory.product.DellMouse;

/**
 * @author dengchao
 * @date 2018/12/5 14:32
 */
public class DellFactory extends PcFactory {
    @Override
    public Mouse createMouse() {
        return new DellMouse();
    }

    @Override
    public Keboy createKeboy() {
        return new DellKeboy();
    }
}
