package com.dps.decorator;

import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 具体实现类
 * @author dengchao
 * @date 2018/11/28 14:49
 */
@Service
public class ConcretComponent implements Component {

    @Override
    public Map<String,String> show() {
        System.out.println("本体: "+this.getClass().getName());
        return null;
    }
}
