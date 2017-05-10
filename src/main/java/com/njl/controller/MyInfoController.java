package com.njl.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.bean.UserAttention;
import com.njl.service.UserAttentionService;
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
	@Autowired
	UserAttentionService userAttentionService;
	
	/**
	 * get my info
	 * 
	 * @return
	 */
	@RequestMapping("/my_info")
	public String getMyInfo(@ModelAttribute("username") String username,
			@ModelAttribute("studentid") Integer studentid, Model model) {

		//my info
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
		//get my attention
		List<User> nicknames = new ArrayList<>();
		List<User> userids = userService.getMyAttention(studentid);//get userid with studentid
		int userid = 0;
		for (User user2 : userids) {
			userid = user2.getUserid();			
		}
		List<UserAttention> friendids = userAttentionService.getMyAttention(userid);//get friendid with userid
		for (UserAttention userAttention : friendids) {
			User user2 = userService.getAttentionNickname(userAttention.getFriendid());//get nickname with friendid
			nicknames.add(user2);
		}
		model.addAttribute("nicknames", nicknames);
		return "my_info";
	}
	
	/**
	 * update user info
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateuserinfo",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateUserInfo(User user){
		userService.updateUserInfo(user);
		return Msg.success();
	}
	
	/**
	 * update user password
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateuserpwd",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateUserPwd(User user, @ModelAttribute("studentid")Integer studentid){
		userService.updateUserPwd(user,studentid);
		return Msg.success();
	}
	
	/**
	 * 检查昵称是否可用
	 * 
	 * @param nickname
	 * @return
	 */
	@RequestMapping(value="/checknickname")
	@ResponseBody
	public Msg checkNick(@RequestParam("nickname") String nickname, @ModelAttribute("studentid")Integer studentid){
		List<User> list = userService.checkNick(nickname);
		
		int cnn = 0;
		for (User us : list) {
			cnn = us.getStudentid();
		}
		
		int key = list.size(); 
		switch (key) {
		case 0:
			return Msg.success();
		case 1:
			if(cnn == studentid){
				return Msg.success();
			}else {
				return Msg.fail();
			}
		default:
			return Msg.fail();
		}
	}
}
