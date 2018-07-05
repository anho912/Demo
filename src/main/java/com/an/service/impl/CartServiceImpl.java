package com.an.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.an.dao.CartInfoMapper;
import com.an.dao.CartMapper;
import com.an.service.CartService;
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private CartInfoMapper cartInfoMapper;
	
}
