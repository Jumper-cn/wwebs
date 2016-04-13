package com.jumper.wwebs.framework.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;

public interface AbstractBaseDao<T> {
	/**
	 * 新增
	 * @param item 实体
	 * @return 主键id
	 */
	public Long add(T item) throws DataAccessException;

	/**
	 * 删除
	 * @param id 单个记录的主键id
	 * @return 如果成功则返回0,1参数错误，2指定id的记录不存在
	 */
	public int del(Long id) throws DataAccessException;
	public int del(T item) throws DataAccessException;
	
	/**
	 * 修改
	 * @param item 实体
	 * @return 
	 */
	public boolean update(T item) throws DataAccessException;

	/**
	 * 获取指定id的店铺信息
	 * @param id 主键id
	 */
	public T getById(Long id) throws DataAccessException;
	
	/**
	 * 获取记录总数
	 * @return 成功则返回记录总数，否则返回null
	 */
	public Long getNumberOfTotal() throws DataAccessException;
	
	/**
	 * 获取列表，分页查询
	 * @param hql 语句
	 */
	public List<T> queryPage(Integer startIndex, Integer endIndex, HibernateCallback<List<T>> action) throws DataAccessException;

	/**
	 * 条件查询
	 * @param hql 语句
	 */
	public List<T> queryConditions(String queryStr) throws DataAccessException;
}
