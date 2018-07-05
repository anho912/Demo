package com.an.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.an.entity.User;
import com.an.service.UserService;
import com.an.utils.Results;
import com.an.vo.DatatablesViewPage;
import com.an.vo.LoginUser;

/**
 * 用户控制器
 * 
 * @author 疯狂的蜗牛君_
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	@ResponseBody
	Results userlogin(LoginUser loginUser, HttpSession session) {
		User user = userService.findByUsername(loginUser.getUsername());
		if (user != null) {
			if (user.getUserRole() != null && user.getUserRole().equals("admin")) {
				if (user.getPassword().equals(loginUser.getPassword())) {
					session.setAttribute("session_user", user);
					return Results.ok("登录成功!");
				} else {
					return Results.error("密码错误，登录失败!");
				}
			}
			return Results.error("用户无权限登录!");
		}
		return Results.error("用户不存在!");
	}

	/**
	 * 退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	String logout(HttpSession session) {
		// 移除session
		session.removeAttribute("session_user");
		return "redirect:/login";
	}

	/**
	 * 分页查询
	 * 
	 * @param searchUserStr
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/userData", method = RequestMethod.GET)
	@ResponseBody
	Results userData(String searchUserStr, int page) {
		String searchStr = "%" + searchUserStr + "%";
		// 获取符合条件的总条数
		long total = userService.selectCount(searchStr);
		// 计算总页数
		long totalPage = total % 10 == 0 ? total / 10 : total / 10 + 1;
		// 查询当页数据
		List<User> users = userService.findUserDataByPageAndCount(10, page, searchStr);
		DatatablesViewPage datatablesViewPage = new DatatablesViewPage(users, totalPage, total);
		return Results.ok("查询成功").put("data", datatablesViewPage);
	}

	/**
	 * 添加一个用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/postUser", method = RequestMethod.POST)
	@ResponseBody
	Results postUser(User user) {
		if (user.getUserRole().equals("1")) {
			user.setUserRole("admin");
		} else {
			user.setUserRole("member");
		}
		user.setCreateDate(new Date(System.currentTimeMillis()));
		User user2 = userService.findByUsername(user.getUserName());
		if (user2 == null) {
			User user3 = userService.findByTel(user.getUserTel());
			if (user3 == null) {
				int sqltype = userService.saveUser(user);
				if (sqltype == 1) {
					return Results.ok("添加成功！");
				}
				return Results.error("添加失败！");
			} else {
				return Results.error("该手机号已绑定其他用户，请更换！");
			}
		} else {
			return Results.error("该用户名已存在，添加失败！");
		}
	}

	/**
	 * 删除会员
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	@ResponseBody
	Results deleteUser(@RequestParam("selectFlags") String[] ids) {
		for (String id : ids) {
			int num = userService.deleteById(Integer.valueOf(id));
			if (num != 1) {
				return Results.error("删除失败");
			}
		}
		return Results.ok();
	}

	/**
	 * 查询一个会员去编辑
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getOneUser", method = RequestMethod.GET)
	@ResponseBody
	ModelAndView getOneUser(@RequestParam("selectFlag") String id) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findById(Integer.valueOf(id));
		if (user != null) {
			modelAndView.addObject("user", user);
			modelAndView.setViewName("form_edit_user");
			return modelAndView;
		} else {
			modelAndView.addObject("info", "用户不存在");
			modelAndView.setViewName("form_user");
			return modelAndView;
		}
	}

	/**
	 * 编辑一个会员
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	@ResponseBody
	Results editUser(User user) {
		if (user.getUserRole().equals("1")) {
			user.setUserRole("admin");
		} else {
			user.setUserRole("member");
		}
		user.setCreateDate(new Date(System.currentTimeMillis()));
		int sqltype = userService.updateUser(user);
		if (sqltype == 1) {
			return Results.ok("修改成功！");
		}
		return Results.error("修改失败！");
	}
	
	/**
	 * 管理员信息
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/adminInfo")
	@ResponseBody
	ModelAndView admininfo(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		User user=(User)session.getAttribute("session_user");
		modelAndView.addObject("user", user);
		modelAndView.setViewName("admininfo");
		return modelAndView;
	}
}
