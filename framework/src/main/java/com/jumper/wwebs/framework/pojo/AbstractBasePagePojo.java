package com.jumper.wwebs.framework.pojo;

import java.util.List;

/**
 * Created by Administrator on 2016/1/20.
 */
public abstract class AbstractBasePagePojo<T> {
    protected int pageSize = 10;               //页尺寸
    protected int pageNo =1;                   //页码，从1开始
    protected long totalNumberOfElement = 0;   //总共元素数
    protected List<T> elementLst;              //记录列表
    //计算变量
    protected int numberOfPage = 0;                //页总数
    
    public AbstractBasePagePojo(int pageSize,int pageNo,long totalNumberOfElement) {
        if (pageNo > 0)
            this.pageNo = pageNo;
        if (pageSize > 0)
            this.pageSize = pageSize;
        if (totalNumberOfElement >= 0)
            this.totalNumberOfElement = totalNumberOfElement;

        this.numberOfPage = (int)((this.totalNumberOfElement%this.pageSize==0)?
                (this.totalNumberOfElement/this.pageSize):
                (this.totalNumberOfElement/this.pageSize+1));
    }

    public int NumberOfElement(){
        if(this.elementLst==null)
            return 0;
        return this.elementLst.size();
    }

    //======计算开始元素位置，从0开始
    public int StartIndex(){
        return (this.pageNo-1) * this.pageSize;
    }
    public int EndIndex(){return this.pageNo * pageSize -1;}

    public boolean isFirstPage(){
        return this.pageNo == 1;
    }
    public boolean isLastPage(){
        return this.pageNo >= this.numberOfPage;
    }

    public boolean hasNextPage(){
        return this.pageNo + 1 <this.numberOfPage;
    }
    public boolean hasPrePage(){
        return this.pageNo > 1;
    }

    public boolean hasPage(){
        return this.pageNo <= this.numberOfPage;
    }

    //=======get or set ======================
    public int getPageSize() {
        return this.pageSize;
    }

    public int getPageNo() {
        return this.pageNo;
    }

    public long getTotalNumberOfElement() {
        return this.totalNumberOfElement;
    }

    public int getNumberOfPage() {
		return numberOfPage;
	}

	public List<T> getElementLst() {
        return elementLst;
    }

    public void setElementLst(List<T> elementLst) {
        this.elementLst = elementLst;
    }
}
