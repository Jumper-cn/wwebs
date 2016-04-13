package com.jumper.wwebs.framework.vo;

import com.jumper.wwebs.framework.pojo.AbstractBasePojo;

public abstract class AbstractResponesVo extends AbstractBasePojo{
	protected Integer responesCode;//返回码
	protected String responesMsg;//返回描述

	public AbstractResponesVo() {
		super();
		this.responesCode = 0;
		this.responesMsg = "成功";
	}

	public AbstractResponesVo(Integer responesCode, String responesMsg) {
		super();
		this.responesCode = responesCode;
		this.responesMsg = responesMsg;
	}

	public Integer getResponesCode() {
		return responesCode;
	}

	public void setResponesCode(Integer responesCode) {
		this.responesCode = responesCode;
	}

	public String getResponesMsg() {
		return responesMsg;
	}

	public void setResponesMsg(String responesMsg) {
		this.responesMsg = responesMsg;
	}
}
