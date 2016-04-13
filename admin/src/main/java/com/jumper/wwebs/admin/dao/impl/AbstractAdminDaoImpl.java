package com.jumper.wwebs.admin.dao.impl;

import com.jumper.wwebs.admin.dao.AbstractAdminDao;
import com.jumper.wwebs.framework.dao.impl.AbstractBaseDaoImpl;

public abstract class AbstractAdminDaoImpl<T> extends AbstractBaseDaoImpl<T> implements AbstractAdminDao<T>{

	public AbstractAdminDaoImpl(Class<T> persistentClass) {
		super(persistentClass);
	}
	
}
