package com.dps.builder;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 15:33
 * 某个具体实现了的建造者类
 */
public class ConcreteBuilder implements Builder {

    private Product product = new Product();
    /**
     * 产品零件建造方法1
     */
    @Override
    public void buildPart1() {
        //构建产品的第一个零件
        product.setPart1("编号:9527");
    }
    /**
     * 产品零件建造方法2
     */
    @Override
    public void buildPart2() {
        //构建产品的第二个零件
        product.setPart2("名称:周星星");
    }
    /**
     * 产品返还方法
     */
    @Override
    public Product retrieveResult() {
        return product;
    }

}
