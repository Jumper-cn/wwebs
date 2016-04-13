package com.jumper.wwebs.framework.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.jumper.wwebs.framework.dao.AbstractBaseDao;

public abstract class AbstractBaseDaoImpl<T> implements AbstractBaseDao<T>{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private HibernateTemplate ormTemplate;

	@Autowired
	private RedisTemplate<String, String> redisTemplate;

	private Class<T> persistentClass;
	
	public Class<T> getPersistentClass(){
        return persistentClass;
    }

	public AbstractBaseDaoImpl(Class<T> persistentClass) {
		super();
		this.persistentClass = persistentClass;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public HibernateTemplate getOrmTemplate() {
		return ormTemplate;
	}

	public RedisTemplate<String, String> getRedisTemplate() {
		return redisTemplate;
	}
	
	@Override
	public Long add(T item) throws DataAccessException {
		long id = 0;
		if (item == null) {// 参数检查
			return id;
		}
		try {
			id = (Long) getOrmTemplate().save(item);
		} catch (DataAccessException e) {
			throw e;
		}
		return id;
	}
	
	@Override
	public int del(Long id) throws DataAccessException {
		int ret = 2;
		if (id <= 0) {// 参数检查
			return 1;
		}
		try {
			T item = getById(id);
			if( item == null ){
				return ret;
			}
			getOrmTemplate().delete(item);
			ret = 0;
		} catch (DataAccessException e) {
			throw e;
		}
		return ret;
	}
	
	@Override
	public int del(T item) throws DataAccessException {
		int ret = 2;
		if (item == null) {// 参数检查
			return 1;
		}
		try {
			getOrmTemplate().delete(item);
			ret = 0;
		} catch (DataAccessException e) {
			throw e;
		}
		return ret;
	}
	
	@Override
	public boolean update(T item) throws DataAccessException {
		boolean resutl = false;
		if (item == null) {// 参数检查
			return resutl;
		}
		try {
			getOrmTemplate().update(item);
			resutl = true;
		} catch (DataAccessException e) {
			throw e;
		}
		return resutl;
	}
	
	@Override
	public T getById(Long id) throws DataAccessException {
		T item = null;
		if (id == null || id == 0L) {// 参数检查
			return item;
		}
		try {
			item = (T) getOrmTemplate().get(getPersistentClass(), id);
		} catch (DataAccessException e) {
			throw e;
		}
		return item;
	}

	@Override
	public Long getNumberOfTotal() throws DataAccessException {
		long result = 0L;
		try {
			String hql = "select count(*) from " + persistentClass.getName();
			result = (Long) getOrmTemplate().find(hql).listIterator().next();
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	
	@Override
	public List<T> queryPage(Integer startIndex, Integer endIndex, HibernateCallback<List<T>> action) throws DataAccessException {
		List<T> result = null;
		if (startIndex == null || endIndex == null ) {// 参数检查
			return result;
		}
		try {
			result = (List<T>) getOrmTemplate().executeWithNewSession(action);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryConditions(String queryStr) throws DataAccessException {
		List<T> list = null;
		if (queryStr == null || queryStr.equals("")) {// 参数检查
			return list;
		}
		try {
			list = (List<T>) getOrmTemplate().find(queryStr);
		} catch (DataAccessException e) {
			throw e;
		}
		return list;
	}
}
