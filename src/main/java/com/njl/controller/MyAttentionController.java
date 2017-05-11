package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
 * my atttention friends
 * @author njl
 *
 */
@Controller
@SessionAttributes({ "username", "studentid" })
public class MyAttentionController {

	@Autowired
	UserAttentionService userAttentionService;
	@Autowired
	UserService userService;

	/**
	 * delete friend with userid friendid
	 * @param friendid
	 * @param studentid
	 * @return
	 */
	@RequestMapping(value = "/deletemyattention/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteMyAttention(@PathVariable("id") Integer friendid, @ModelAttribute("studentid") Integer studentid) {
		//根据studentid 获取 userid
		int userid = 0;
		List<User> us = userService.queryUserWithStu(studentid);
		for (User user2 : us) {
			userid = user2.getUserid();
		}
		userAttentionService.deleteFriend(friendid,userid);
		return Msg.success();
	}
	
	/**
	 * add attention friend
	 * @param friendid
	 * @param studentid
	 * @return
	 */
	@RequestMapping(value="/addmyattention",method=RequestMethod.POST)
	@ResponseBody
	public Msg addMyAttention(@RequestParam("userid") Integer friendid,@ModelAttribute("studentid") Integer studentid){
		//根据studentid 获取 userid
		int userid = 0;
		List<User> us = userService.queryUserWithStu(studentid);
		for (User user2 : us) {
			userid = user2.getUserid();
		}
		//查看好友是否已经存在
		long count = userAttentionService.selectFrient(userid,friendid);
		if(count > 0){
			return Msg.fail();
		}else{
			//add friend
			UserAttention userAttention = new UserAttention();
			userAttention.setUserid(userid);
			userAttention.setFriendid(friendid);
			userAttentionService.addFriend(userAttention);
			return Msg.success();
		}
	}

}
