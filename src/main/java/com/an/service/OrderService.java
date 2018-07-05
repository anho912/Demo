package com.an.service;

import java.util.Date;
import java.util.List;

import com.an.entity.Order;
import com.an.entity.OrderInfo;
import com.an.utils.Results;
import com.an.vo.OrderVo;

/**
 * 订单服务端接口
 * @author 疯狂的蜗牛君_
 *
 */
public interface OrderService {

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
	List<OrderVo> findOrderDataByPageAndCount(int i, int page, String searchStr);

	/**
	 * 受理一个订单
	 * @param valueOf
	 * @return
	 */
	int updateOrder(Integer valueOf);

	/**
	 * 查询一个订单详情
	 * @param orderid
	 * @return
	 */
	List<OrderInfo> findOrderInfoByOrderId(Integer orderid);

	/**
	 * 查询一个订单
	 * @param valueOf
	 * @return
	 */
	Order findOrderById(Integer valueOf);

	/**
	 * 根据时间范围查看所有订单信息
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	Results findAllOrderInfoByDate(Date startDate, Date endDate);

	/**
	 * 根据时间范围和指定商品类目 查看本类目下的订单信息
	 * @param type
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	Results findAllOrderTypeByDate(Integer type, Date startDate, Date endDate);

}
