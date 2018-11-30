package com.dps.factory.factorymethod.exportfileimpl;

import com.dps.factory.factorymethod.ExportFile;

/**
 * @author dengchao
 * @date 2018/11/30 14:54
 */
public class ExportFilePdf implements ExportFile {
    @Override
    public String export() {
        return"当前类型: "+this.getClass().getName()+"! 可使用类型:type=Pdf,Text,Excel";
    }
}
