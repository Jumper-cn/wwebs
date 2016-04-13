package com.jumper.wwebs.framework.utils;

/**
 * Created by Administrator on 2015/12/11.
 */
public final class EnvironmentUtil {
    private static String _newLine = "";
    public static String newLine() {
        if ("".equals(_newLine)) {
            String tempValue = System.getProperty("line.separator");
            if(null == tempValue){
                _newLine = "\r\n";
            }else{
                _newLine = tempValue;
            }
        }

        return _newLine;
    }
}
