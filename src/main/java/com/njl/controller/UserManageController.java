package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.service.UserManageService;

/**
 * 对用户管理的CRUD
 * @author njl
 *
 */
@Controller
public class UserManageController {
	
	//调用service层的业务逻辑组件
	//自动装配service层的业务逻辑组件
	@Autowired
	UserManageService userManageService;
	
	/**
	 * 查询用户数据
	 * @return
	 */
	@RequestMapping("/manage_user")
	public String getUser(Model model){
		//service查出用户的所有数据
		List<User> userlist = userManageService.getAll();
		model.addAttribute("userlist", userlist);
		
		return "manage_user";
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/user/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteUserById(@PathVariable("id") Integer id){
		userManageService.deleteUser(id);
		return Msg.success();
	}
	
	/**
	 * 修改用户
	 * @param user
	 * @return
	 * Tomcat不会封装PUT请求的数据为map，只封装POST请求的数据
	 * 直接发送put之类的请求还要封装请求体中的数据；
	 * 配置HiddenHttpMethodFilter；
	 * 作用：将请求体中的数据包装成一个map，request被重新包装，request.getParameter()被重写，从自己封装的map中取数据
	 */
	@RequestMapping(value="/user/{userid}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateUser(User user){
		userManageService.updateUser(user);
		return Msg.success();
	}
	
	/**
	 * 新增用户
	 * @return
	 */
	@RequestMapping(value="/user", method=RequestMethod.POST)
	@ResponseBody
	public Msg saveUser(User user){
		long time = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(time);
		user.setCreatetime(date);
		userManageService.saveUser(user);
		return Msg.success();
	}
	
	/**
	 * 检查昵称是否可用
	 * @param nickname
	 * @return
	 */
	@RequestMapping(value="/checknick")
	@ResponseBody
	public Msg checkNick(@RequestParam("nickname") String nickname){
		boolean b = userManageService.checkNick(nickname);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 检查学号是否可用
	 * @param nickname
	 * @return
	 */
	@RequestMapping(value="/checkstudentid")
	@ResponseBody
	public Msg checkStudentid(@RequestParam("studentid") Integer studentid){
		boolean b = userManageService.checkStudentid(studentid);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
//	/**
//	 * 查询用户数据
//	 * 要使@ResponseBody正常工作，需要导入jackson包，负责将返回的对象转换为json字符创
//	 * @return
//	 */
//	@RequestMapping("/manageuser")
//	@ResponseBody
//	public Msg getUser(Model model){
//		
//		List<User> userlist = userManageService.getAll();
//		//model.addAttribute("userlist", userlist);
//		return Msg.success().add("userlist", userlist);
//	}
}

