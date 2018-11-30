package com.dps.factory.factorymethod.exportfileimpl;

import com.dps.factory.factorymethod.ExportFile;

/**
 * @author dengchao
 * @date 2018/11/30 16:06
 */
public class ExportFileWrongType implements ExportFile {
    @Override
    public String export() {
        return "类型错误! 可使用类型:type=Pdf,Text,Excel";
    }
}
