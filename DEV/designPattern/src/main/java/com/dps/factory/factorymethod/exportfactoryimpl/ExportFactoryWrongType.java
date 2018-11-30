package com.dps.factory.factorymethod.exportfactoryimpl;

import com.dps.factory.factorymethod.ExportFactory;
import com.dps.factory.factorymethod.ExportFile;
import com.dps.factory.factorymethod.exportfileimpl.ExportFileWrongType;

/**
 * @author dengchao
 * @date 2018/11/30 16:07
 */
public class ExportFactoryWrongType implements ExportFactory {
    @Override
    public ExportFile getExportFile() {
        return new ExportFileWrongType();
    }
}
