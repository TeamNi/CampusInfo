package com.njl.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
 * 登录相关
 * 
 * @author njl
 *
 */
@Controller
@SessionAttributes({ "username" })
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
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String getLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("role") String role, Model model, HttpServletRequest request) {

		model.addAttribute("username", username);

		System.out.println(username + "====" + password + "====" + role);
		// 管理员
		if ("admin".equals(role)) {
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
		// 普通用户
		if ("user".equals(role)) {
			long count = userService.queryUser(username, password);
			// count > 0 账号存在
			if (count > 0) {
				return "index";
			} else {
				request.getSession().setAttribute("failInfo", "账号或密码错误");
				return "redirect:/login.jsp";
			}
		}
		return null;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, @ModelAttribute("username") String username,
			SessionStatus status) {
		// 清除session
		 Enumeration<String> em = request.getSession().getAttributeNames();
		 while (em.hasMoreElements()) {
		 request.getSession().getAttribute(em.nextElement().toString());
		 }
		 status.setComplete();
		 request.getSession().removeAttribute(username);
		 request.getSession().invalidate();
		// 拼接跳转路径
		String projectName = request.getContextPath();
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + projectName
				+ "/";

		return "redirect:" + path;
	}
}
