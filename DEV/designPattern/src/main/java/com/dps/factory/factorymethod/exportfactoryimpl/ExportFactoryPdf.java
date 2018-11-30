package com.dps.factory.factorymethod.exportfactoryimpl;

import com.dps.factory.factorymethod.ExportFactory;
import com.dps.factory.factorymethod.ExportFile;
import com.dps.factory.factorymethod.exportfileimpl.ExportFilePdf;

/**
 * @author dengchao
 * @date 2018/11/30 15:03
 */
public class ExportFactoryPdf implements ExportFactory {
    @Override
    public ExportFile getExportFile() {
        return new ExportFilePdf();
    }
}
