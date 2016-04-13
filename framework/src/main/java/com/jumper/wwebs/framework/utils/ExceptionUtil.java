package com.jumper.wwebs.framework.utils;

/**
 * Created by Administrator on 2015/12/11.
 */
public final class ExceptionUtil {

    public static String getStacktrace(Exception ex){
        StringBuilder msg = new StringBuilder();
        if(null != ex){
            msg.append(ex.getMessage());
            StackTraceElement[] stackList = ex.getStackTrace();
            if(null != stackList){
                for(StackTraceElement el : stackList){
                    msg.append(EnvironmentUtil.newLine());
                    msg.append(el.toString());
                }
            }
        }

        return msg.toString();
    }
}
