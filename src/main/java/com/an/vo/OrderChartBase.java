package com.an.vo;

/**
 * 订单图表信息基础类
 * @author 疯狂的蜗牛君_
 *
 */
public class OrderChartBase {
	/**
     * 类目或具体商品名称
     */
    private String name;
    /**
     * 订单量
     */
    private Integer orderNum;
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
    
}
