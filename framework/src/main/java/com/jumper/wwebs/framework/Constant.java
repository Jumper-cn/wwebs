package com.jumper.wwebs.framework;

public class Constant {
	/**
	 * 全局通用返回码及描述
	 * */
	public static final Integer RESPONES_SUCCESS = 0;
	public static final String RESPONES_SUCCESS_MSG = "成功";
	public static final Integer RESPONES_SUBMITDATA_ERROR = 100000;
	public static final String RESPONES_SUBMITDATA_ERROR_MSG = "请求方提交数据格式错误";
	public static final Integer RESPONES_PARAM_ERROR = 100001;
	public static final String RESPONES_PARAM_ERROR_MSG = "缺少必要的参数";
	public static final Integer RESPONES_TOKEN_ERROR = 100002;
	public static final String RESPONES_TOKEN_ERROR_MSG = "访问令牌错误";
	public static final Integer RESPONES_UNKNOW_ERROR = 100003;
	public static final String RESPONES_UNKNOW_ERROR_MSG = "未知错误";
}
