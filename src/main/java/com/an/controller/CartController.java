package com.an.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.an.service.CartService;

/**
 * 购物车控制器
 * @author 疯狂的蜗牛君_
 *
 */
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
}
