package com.an.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 综合控制器
 * @author 
 *
 */
@Controller
public class ApiController {

	/**
	 * 动态路径
	 * @param path
	 * @return
	 */
	@RequestMapping(value="/{path}")
	public String mpath(@PathVariable String path) {
		System.out.println("进来了");
		return path;
	}	
}
