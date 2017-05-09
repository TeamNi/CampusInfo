package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.User;
import com.njl.service.UserService;

/**
 * my info
 * 
 * @author njl
 *
 */
@Controller
@SessionAttributes({ "username", "studentid" })
public class MyInfoController {

	@Autowired
	UserService userService;

	/**
	 * my info
	 * 
	 * @return
	 */
	@RequestMapping("/my_info")
	public String getMyInfo(@ModelAttribute("username") String username,
			@ModelAttribute("studentid") Integer studentid, Model model) {

		User user = new User();
		List<User> userlist = userService.queryUserWithStu(studentid);
		for (User us : userlist) {
			user.setContact(us.getContact());
			user.setCreatetime(us.getCreatetime());
			user.setHeadurl(us.getHeadurl());
			user.setNickname(us.getNickname());
			user.setPassword(us.getPassword());
			user.setSafeanswer(us.getSafeanswer());
			user.setSafequestion(us.getSafequestion());
			user.setSex(us.getSex());
			user.setStudentid(us.getStudentid());
			user.setUserid(us.getUserid());
			user.setUsername(us.getUsername());
		}
		model.addAttribute("user", user);
		return "my_info";
	}
}
