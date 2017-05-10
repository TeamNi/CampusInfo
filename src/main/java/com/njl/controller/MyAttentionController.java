package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.service.UserAttentionService;
import com.njl.service.UserService;

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
		int userid = 0;
		List<User> us = userService.queryUserWithStu(studentid);
		for (User user2 : us) {
			userid = user2.getUserid();
		}
		userAttentionService.deleteFriend(friendid,userid);
		System.out.println(friendid);
		return Msg.success();
	}

}
