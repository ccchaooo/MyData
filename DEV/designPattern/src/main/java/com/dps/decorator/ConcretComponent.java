package com.dps.decorator;

import org.springframework.stereotype.Service;

/**
 * 具体实现类
 * @author dengchao
 * @date 2018/11/28 14:49
 */
@Service
public class ConcretComponent implements Component {

    @Override
    public void show() {

        System.out.println("被装饰的对象: "+this.getClass().getName());
    }
}
