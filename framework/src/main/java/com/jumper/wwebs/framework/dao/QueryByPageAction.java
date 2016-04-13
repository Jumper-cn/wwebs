package com.jumper.wwebs.framework.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

/**
 * Created by Administrator on 2016/1/20.
 */
public abstract class QueryByPageAction<T> implements HibernateCallback<List<T>> {
    private int startIndex = 0;
    private int endIndex = 0;

    /**
     * 按
     * @param startIndex 开始记录位置，包含，从0开始
     * @param endIndex   结束记录位置,包含，必须大于或者等于startIndex
     */
    public QueryByPageAction(int startIndex,int endIndex){
        if(startIndex>=0)
            this.startIndex = startIndex;
        if(endIndex>=startIndex)
            this.endIndex = endIndex;
    }

    public abstract List<T> doInHibernate(Session var1) throws HibernateException, SQLException;

    public int getStartIndex() {
        return startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }
}
