package com.dps.factory.factorymethod;

/**
 * @author dengchao
 * @date 2018/11/30 14:22
 * 工厂方法接口
 */
public interface ExportFactory {

    /**
     * @return 返回对应的实际产品,返回类型为产品接口
     */
    ExportFile getExportFile();
}
