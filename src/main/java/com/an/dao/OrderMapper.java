package com.an.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.an.entity.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    /**
     * 查询总记录数
     * @param searchStr
     * @return
     */
	long selectCount(String searchStr);

	/**
	 * 分页查询
	 * @param i
	 * @param page
	 * @param searchStr
	 * @return
	 */
	List<Order> findOrderDataByPageAndCount(int i, int page, String searchStr);

	/**
	 * 根据id去查询一个订单
	 * @param valueOf
	 * @return
	 */
	Order findById(Integer valueOf);

	/**
	 * 更新订单状态
	 * @param order
	 * @return
	 */
	int updateOrder(Order order);

	/**
	 * 查看指定时间范围内完成的订单
	 * @param startDate
	 * @param endDate
	 * @param i
	 * @return
	 */
	List<Order> findByDateAndOrderType(Timestamp startDate, Timestamp endDate, int i);
}