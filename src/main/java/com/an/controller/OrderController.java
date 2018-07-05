package com.an.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.an.entity.Order;
import com.an.entity.OrderInfo;
import com.an.entity.Product;
import com.an.entity.User;
import com.an.service.OrderService;
import com.an.service.ProductService;
import com.an.service.UserService;
import com.an.utils.Results;
import com.an.vo.DatatablesViewPage;
import com.an.utils.DateUtil;
import com.an.vo.OrderVo;

/**
 * 订单控制器
 * 
 * @author 疯狂的蜗牛君_
 *
 */
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService ProductService;

	@Autowired
	private UserService UserService;

	@Autowired
	private DateUtil dateUtil;

	/**
	 * 分页查询
	 * 
	 * @param searchOrderStr
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/OrderData", method = RequestMethod.GET)
	@ResponseBody
	Results OrderData(String searchOrderStr, int page) {
		String searchStr = "%" + searchOrderStr + "%";
		// 获取符合条件的总条数
		long total = orderService.selectCount(searchStr);
		// 计算总页数
		long totalPage = total % 10 == 0 ? total / 10 : total / 10 + 1;
		// 查询当页数据
		List<OrderVo> orders = orderService.findOrderDataByPageAndCount(10, page, searchStr);
		DatatablesViewPage datatablesViewPage = new DatatablesViewPage(orders, totalPage, total);
		return Results.ok("查询成功").put("data", datatablesViewPage);
	}

	/**
	 * 跳转订单详情页面
	 * 
	 * @param orderid
	 * @return
	 */
	@RequestMapping(value = "/findOrderInfo")
	@ResponseBody
	ModelAndView findOrderInfo(Integer orderid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("OrderId", orderid);
		modelAndView.setViewName("find_orderInfo");
		return modelAndView;
	}

	/**
	 * 查看一个订单详情
	 * 
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value = "/findOrderInfoList", method = RequestMethod.GET)
	@ResponseBody
	Results findOrderInfoList(Integer orderId) {
		System.err.println(orderId);
		List<OrderInfo> orderInfos = orderService.findOrderInfoByOrderId(orderId);
		List<Product> products = new ArrayList<>();
		for (OrderInfo orderInfo : orderInfos) {
			Product product = ProductService.findById(orderInfo.getProId());
			products.add(product);
		}
		return Results.ok().put("orderInfos", orderInfos).put("products", products);
	}

	/**
	 * 处理一个订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/editOrder", method = RequestMethod.GET)
	@ResponseBody
	Results editOrder(@RequestParam("selectFlags") String[] ids) {
		for (String id : ids) {
			int num = orderService.updateOrder(Integer.valueOf(id));
			if (num != 1) {
				return Results.error().put("data_info", "订单处理失败，编号为:" + id);
			}
			// 更新用户的积分数量和等级信息
			Order order = orderService.findOrderById(Integer.valueOf(id));
			User user = UserService.findById(order.getUserId());
			List<OrderInfo> orderInfos = orderService.findOrderInfoByOrderId(Integer.valueOf(id));
			for (OrderInfo orderInfo : orderInfos) {
				user.setUserIntegral(user.getUserIntegral()
						+ Integer.parseInt(new DecimalFormat("0").format(orderInfo.getoInfoMoney())));
				if (user.getUserIntegral() < 1000) {
					user.setUserGender("青铜会员");
				} else if (user.getUserIntegral() >= 1000 & user.getUserIntegral() < 3000) {
					user.setUserGender("白银会员");
				} else if (user.getUserIntegral() >= 3000 & user.getUserIntegral() < 8000) {
					user.setUserGender("黄金会员");
				} else if (user.getUserIntegral() >= 8000 & user.getUserIntegral() < 15000) {
					user.setUserGender("钻石会员");
				} else {
					user.setUserGender("星耀会员");
				}
				int num2 = UserService.updateUser(user);
				if (num2 != 1) {
					return Results.error("更新用户信息失败");
				}
			}

		}
		return Results.ok().put("data_info", "处理成功");
	}

	/**
	 * 获取图表信息
	 * 
	 * @param timeScope
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/getChartData")
	@ResponseBody
	public Results getChartData(Integer timeScope, Integer type) {
		long nd = 1000 * 24 * 60 * 60;
		switch (timeScope) {
		case 0:
			return getChartInfoCode(7, type);
		case 1:
			return getChartInfoCode(30, type);
		case 2:
			return getChartInfoCode(60, type);
		case 3:
			Date date2 = dateUtil.minusMonth(new Date(), 6);
			// 获得两个时间的毫秒时间差异
			long diff = new Date().getTime() - date2.getTime();
			// 计算差多少天
			int day = (int) (diff / nd);
			return getChartInfoCode(day, type);
		default:
			break;
		}
		return Results.ok();
	}

	/**
	 * 获取图表信息 代码块
	 * 
	 * @param day
	 * @param type
	 * @return
	 */
	Results getChartInfoCode(int day, Integer type) {
		Date startDate = dateUtil.minusDay(new Date(), day);
		Date endDate = new Date();
		if (type == 0) {
			return orderService.findAllOrderInfoByDate(startDate, endDate);
		} else {
			return orderService.findAllOrderTypeByDate(type, startDate, endDate);
		}
	}
}
