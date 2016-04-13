package com.jumper.wwebs.admin.controller;

import javax.servlet.http.HttpServletRequest;

import com.jumper.wwebs.framework.controller.AbstractBaseController;

public class AbstractAdminController extends AbstractBaseController{

	protected boolean sessionCheck(HttpServletRequest request){
		//TODO: deal
		return false;
	}
}
