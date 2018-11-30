package com.clients;

import com.dps.factory.factorymethod.ExportFactory;
import com.dps.factory.factorymethod.exportfactoryimpl.ExportFactoryWrongType;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class FactoryMethodClient implements Client {

    /**
     * @param type 文件类型
     * @return 对应类型的工厂
     */
    private ExportFactory getFactory(String type) {
        try {
//            return (ExportFactory)Class.forName("java.com.dps.factory.factorymethod.exportfactoryimpl.ExportFactory"+type).newInstance();
            return (ExportFactory)Class.forName("java.com.dps.factory.factorymethod.exportfactoryimpl.ExportFactoryPdf").newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return new ExportFactoryWrongType();
        }
        //默认输出
        return new ExportFactoryWrongType();
    }

    public String clientInterface(String type) {
        return getFactory(type).getExportFile().export();
    }
}
