package com.jumper.wwebs.framework.utils;

import org.slf4j.Logger;

/**
 * Created by Administrator on 2015/12/11.
 */
public final class LogUtil {
    private static Logger DEFAULT = org.slf4j.LoggerFactory.getLogger("root");
    public static synchronized Logger getLogger(String category){
        Logger logger = org.slf4j.LoggerFactory.getLogger(category);
        if(null == logger)
            logger = DEFAULT;

        return logger;
    }

    /**
     * 测试对应的日志是否debug
     * @param category
     * @return
     */
    public static boolean isDebug(String category){
        return getLogger(category).isDebugEnabled();
    }

    /**
     * 输出Trace消息
     * @param loggerName 日志输出目标地,可选，不存在则默认输出
     * @param msg        消息           可选
     * @param ex         异常           可选
     */
    public static void trace(String loggerName,String msg,Exception ex){
        if(isEmpty(msg) && null == ex)
            return;

        StringBuilder logMsg = new StringBuilder(null==msg?"":msg);
        if(null != ex) {
            logMsg.append(EnvironmentUtil.newLine());
            logMsg.append(ExceptionUtil.getStacktrace(ex));
        }

        getLogger(loggerName).info(logMsg.toString());
    }

    /**
     * 输出Error消息
     * @param loggerName 日志输出目标地,可选，不存在则默认输出
     * @param msg        消息           可选
     * @param ex         异常           可选
     */
    public static void error(String loggerName,String msg,Exception ex){
        if(isEmpty(msg) && null == ex)
            return;

        StringBuilder logMsg = new StringBuilder(null==msg?"":msg);
        if(null != ex) {
            logMsg.append(EnvironmentUtil.newLine());
            logMsg.append(ExceptionUtil.getStacktrace(ex));
        }

        getLogger(loggerName).error(logMsg.toString());
    }

    /**
     * 输出警告消息
     * @param loggerName 日志输出目标地,可选，不存在则默认输出
     * @param msg        消息           可选
     * @param ex         异常           可选
     */
    public static void warn(String loggerName,String msg,Exception ex){
        if(isEmpty(msg) && null == ex)
            return;

        StringBuilder logMsg = new StringBuilder(null==msg?"":msg);
        if(null != ex) {
            logMsg.append(EnvironmentUtil.newLine());
            logMsg.append(ExceptionUtil.getStacktrace(ex));
        }

        getLogger(loggerName).warn(logMsg.toString());
    }

    /**
     * 输出警告消息
     * @param loggerName 日志输出目标地,可选，不存在则默认输出
     * @param msg        消息           可选
     */
    public static void info(String loggerName,String msg){
        if(isEmpty(msg))
            return;
        getLogger(loggerName).info(msg);
    }

    public static boolean isEmpty(String str){
        boolean empty = true;
        if(null == str)
            return empty;
        str = str.trim();
        if("".equals(str))
            return empty;

        empty = false;
        return empty;
    }
}
