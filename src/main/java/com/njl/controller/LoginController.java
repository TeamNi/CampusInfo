package com.njl.controller;

import java.sql.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.njl.bean.User;
import com.njl.service.AdminService;
import com.njl.service.UserManageService;
import com.njl.service.UserService;

/**
 * 登录注册相关
 * 
 * @author njl
 *
 */
@Controller
@SessionAttributes({ "username","myself" })
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;
	@Autowired
	UserManageService userManageService;

	/**
	 * login
	 * 
	 * @param username
	 * @param password
	 * @param role
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String getLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("role") String role, Model model, HttpServletRequest request) {

		// 管理员 admin
		if ("admin".equals(role)) {
			model.addAttribute("username", username);
			long count = adminService.queryAdmin(username, password);
			// count > 0 账号存在
			if (count > 0) {
				List<User> userlist = userManageService.getAll();
				model.addAttribute("userlist", userlist);
				return "manage_user";
			} else {
				request.getSession().setAttribute("failInfo", "账号或密码错误");
				return "redirect:/login.jsp";
			}
		}
		
		// 普通用户 user
		if ("user".equals(role)) {
			List<User> list = userService.queryUserLogin(username, password);
			// count > 0 账号存在
			if (list.size() > 0) {
				int userid = 0;
				for (User user : list) {
					userid = user.getUserid();
					model.addAttribute("studentid", user.getStudentid());
				}
				//根据userid获取用户信息,放入session中
				User mySelf = userService.queryUserWithUserid(userid);
				model.addAttribute("myself", mySelf);
				return "index";
			} else {
				request.getSession().setAttribute("failInfo", "账号或密码错误");
				return "redirect:/login.jsp";
			}
		}
		return null;
	}

	/**
	 * logout
	 * 
	 * @param request
	 * @param username
	 * @param status
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, SessionStatus status) {
		// 清除session
		Enumeration<String> em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().getAttribute(em.nextElement().toString());
		}
		status.setComplete();
		request.getSession().invalidate();
		// 拼接跳转路径
		String projectName = request.getContextPath();
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ projectName + "/";

		return "redirect:" + path;
	}

	/**
	 * register user
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(User user, Model model) {
		model.addAttribute("studentid", user.getStudentid());
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		user.setCreatetime(date);
		userService.registerUser(user);
		//根据studentid 获得userid
		int userid = 0;
		List<User> userlist = userService.queryUserWithStu(user.getStudentid());
		for (User user0 : userlist) {
			userid = user0.getUserid();
		}
		//update session value
		User myself = userService.queryUserWithUserid(userid);
		model.addAttribute("myself",myself);
		return "index";
	}
	
	/**
	 * 忘记密码
	 * 
	 * @return
	 */
	@RequestMapping(value="/reset")
	public String reset(User user, Model model, HttpServletRequest request){
		List<User> list = userService.getUser(user);
		if(list.size() > 0){
			for (User user2 : list) {
				model.addAttribute("studentid", user2.getStudentid());
				//根据studentid 获得userid
				int userid = 0;
				List<User> userlist = userService.queryUserWithStu(user.getStudentid());
				for (User user0 : userlist) {
					userid = user0.getUserid();
				}
				//update session value
				User myself = userService.queryUserWithUserid(userid);
				model.addAttribute("myself",myself);
			}
			return "index";
		}else {
			request.getSession().setAttribute("failInfo", "输入的信息不匹配！");
			return "redirect:/login.jsp";
		}
		
	}
}
