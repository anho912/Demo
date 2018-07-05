package com.an.dao;

import java.util.List;

import com.an.entity.OrderInfo;;

public interface OrderInfoMapper {
    int deleteByPrimaryKey(Integer oInfoId);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    OrderInfo selectByPrimaryKey(Integer oInfoId);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);

    /**
     * 根据一个订单id查询订单详情集合
     * @param orderid
     * @return
     */
	List<OrderInfo> selectByOrderId(Integer orderid);
}