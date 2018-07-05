package com.an.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.an.dao.OrderInfoMapper;
import com.an.dao.OrderMapper;
import com.an.dao.ProductMapper;
import com.an.dao.UserMapper;
import com.an.entity.Order;
import com.an.entity.OrderInfo;
import com.an.entity.Product;
import com.an.entity.User;
import com.an.service.OrderService;
import com.an.utils.Results;
import com.an.vo.OrderChartBase;
import com.an.vo.OrderVo;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private OrderInfoMapper orderInfoMapper;

	@Override
	public long selectCount(String searchStr) {
		// TODO Auto-generated method stub
		return orderMapper.selectCount(searchStr);
	}

	@Override
	public List<OrderVo> findOrderDataByPageAndCount(int i, int page, String searchStr) {
		// TODO Auto-generated method stub
		if (page < 1) {
			page = 1;
		}
		List<Order> orders = orderMapper.findOrderDataByPageAndCount(i, (page - 1) * i, searchStr);
		List<OrderVo> orderVos = new ArrayList<>();
		for (Order order : orders) {
			User user = userMapper.findById(order.getUserId());
			OrderVo orderVo = new OrderVo();
			orderVo.setUserName(user.getUserName());
			orderVo.setOrderId(order.getOrderId());
			orderVo.setOrderType(order.getOrderType());
			orderVo.setIsAccept(order.getIsAccept());
			orderVo.setCreateDate(order.getCreateDate());
			orderVos.add(orderVo);
		}
		return orderVos;
	}

	@Override
	public int updateOrder(Integer valueOf) {
		// TODO Auto-generated method stub
		Order order = orderMapper.findById(valueOf);
		order.setIsAccept(1);
		order.setOrderType(1);
		return orderMapper.updateOrder(order);
	}

	@Override
	public List<OrderInfo> findOrderInfoByOrderId(Integer orderid) {
		// TODO Auto-generated method stub
		return orderInfoMapper.selectByOrderId(orderid);
	}

	@Override
	public Order findOrderById(Integer valueOf) {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(valueOf);
	}

	@Override
	public Results findAllOrderInfoByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		List<OrderChartBase> orderChartBases = new ArrayList<>();
		// 图书订单总量（数量）
		int orderSum = 0;
		List<Integer> productIds = new ArrayList<Integer>();
		List<Integer> productSum = new ArrayList<Integer>();
		Timestamp timestamp = new Timestamp(startDate.getTime());
		Timestamp timestamp2 = new Timestamp(endDate.getTime());
		// 查看时间范围内的所有订单详情
		List<Order> orders = orderMapper.findByDateAndOrderType(timestamp, timestamp2, 1);
		List<OrderInfo> orderInfoss = new ArrayList<>();
		for (int i = 0; i < orders.size(); i++) {
			List<OrderInfo> orderInfos = orderInfoMapper.selectByOrderId(orders.get(i).getOrderId());
			for (int j = 0; j < orderInfos.size(); j++) {
				orderInfoss.add(orderInfos.get(j));
			}
		}
		
		for (int j = 0; j < orderInfoss.size(); j++) {
			if (!productIds.contains(orderInfoss.get(j).getProId())) {
				productIds.add(orderInfoss.get(j).getProId());
				// 查看每本书的订单总量
				int productNum = 0;
				for (int m = 0; m < orderInfoss.size(); m++) {
					if (orderInfoss.get(m).getProId() == orderInfoss.get(j).getProId()) {
						productNum += orderInfoss.get(m).getProNum();
					}
				}
				productSum.add(productNum);
				orderSum += productNum;
			}
		}
		// 查看每一类的订单情况
		List<String> proDescriptions = new ArrayList<>();
		for (int n = 0; n < productIds.size(); n++) {
			Product product = productMapper.findById(productIds.get(n));
			String proDescription = product.getProDescription();
			if (!proDescriptions.contains(product.getProDescription())) {
				int proDescriptionNum = 0;
				proDescriptions.add(product.getProDescription());
				for (int z = 0; z < productIds.size(); z++) {
					Product product1 = productMapper.findById(productIds.get(z));
					if (product1.getProDescription().equals(product.getProDescription())) {
						for(int s=0;s<productIds.size();s++) {
							if(productIds.get(s)==product1.getProId()) {
								proDescriptionNum += productSum.get(s);
							}
						}
					}
				}
				OrderChartBase orderChartBase=new OrderChartBase();
				orderChartBase.setName(proDescription);
				orderChartBase.setOrderNum(proDescriptionNum);
				orderChartBases.add(orderChartBase);
			}
		}
		return Results.ok().put("orderChartBases", orderChartBases).put("orderSum", orderSum);
	}

	@Override
	public Results findAllOrderTypeByDate(Integer type, Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
