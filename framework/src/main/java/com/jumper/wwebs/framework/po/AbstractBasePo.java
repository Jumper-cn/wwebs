package com.jumper.wwebs.framework.po;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 持久化对象顶层抽象类
 * */
public abstract class AbstractBasePo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7664851072853907337L;
	protected Long id;			//id,主键
	protected Timestamp createTime;	//记录创建时间
	protected Timestamp updateTime;	//记录修改时间

	public AbstractBasePo() {
		super();
		this.id = 0L;
		this.createTime = new Timestamp(1451577600);
		this.updateTime = new Timestamp(1451577600);
	}

	public AbstractBasePo(Long id, Timestamp createTime, Timestamp updateTime) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
}
