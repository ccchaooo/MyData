package com.dps.builder;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 15:32
 * 具体的产类
 */
@Service
public class Product {
    /**
     * 定义一些关于产品的操作
     */
    private String part1;
    private String part2;

    public String getPart1() {
        return part1;
    }
    public void setPart1(String part1) {
        this.part1 = part1;
    }
    public String getPart2() {
        return part2;
    }
    public void setPart2(String part2) {
        this.part2 = part2;
    }

    @Override
    public String toString() {
        return "Product{" +
                "part1='" + part1 + '\'' +
                ", part2='" + part2 + '\'' +
                '}';
    }

}
