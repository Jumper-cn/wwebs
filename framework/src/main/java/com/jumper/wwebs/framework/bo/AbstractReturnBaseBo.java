package com.jumper.wwebs.framework.bo;

import com.jumper.wwebs.framework.pojo.AbstractBasePojo;

public abstract class AbstractReturnBaseBo extends AbstractBasePojo{
	protected Integer returnCode;
	protected String returnMsg;
	
	public AbstractReturnBaseBo() {
		super();
		this.returnCode = 0;
		this.returnMsg = "成功";
	}

	public AbstractReturnBaseBo(Integer returnCode, String returnMsg) {
		super();
		this.returnCode = returnCode;
		this.returnMsg = returnMsg;
	}

	public Integer getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(Integer returnCode) {
		this.returnCode = returnCode;
	}

	public String getReturnMsg() {
		return returnMsg;
	}

	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}
}
