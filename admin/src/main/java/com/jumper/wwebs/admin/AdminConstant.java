package com.jumper.wwebs.admin;

public class AdminConstant {
	/**
	 * session key
	 * */
	public static final String LOGINED_USER_ID = "loginedUserId";
	
	/**
	 * 模块返回码及描述
	 * */
	public static final Integer RESPONES_ADMIN_USER_NOTEXIST = 200000;
	public static final String RESPONES_ADMIN_USER_NOTEXIST_MSG = "账号或密码不正确";
	
	public static final Integer RESPONES_ADMIN_PERMISSION_ERROR = 200001;
	public static final String RESPONES_ADMIN_PERMISSION_ERROR_MSG = "获取权限列表失败";
	
	public static final Integer RESPONES_ADMIN_ROLES_ERROR = 200002;
	public static final String RESPONES_ADMIN_ROLES_ERROR_MSG = "获取角色列表失败";
	
	public static final Integer RESPONES_ADMIN_USERS_ERROR = 200003;
	public static final String RESPONES_ADMIN_USERS_ERROR_MSG = "获取用户列表失败";
}
