package com.njl.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.Msg;
import com.njl.bean.Used;
import com.njl.bean.UsedAttention;
import com.njl.bean.User;
import com.njl.service.MyUsedService;
import com.njl.service.UsedAttentionService;
import com.njl.service.UsedReplyService;
import com.njl.service.UserService;

/**
 * my used
 * @author njl
 *
 */
@Controller
@SessionAttributes({"username","studentid"})
public class MyUsedController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MyUsedService myUsedService;
	@Autowired
	private UsedReplyService usedReplyService;
	@Autowired
	private UsedAttentionService usedAttentionService;

	/**
	 * to my used page
	 * @return
	 */
	@RequestMapping("/my_used")
	public String getMyUsed(@ModelAttribute("studentid")Integer studentid,Model model){
		//根据studentid 获得userid
		int userid = 0;
		List<User> userlist = userService.queryUserWithStu(studentid);
		for (User user : userlist) {
			userid = user.getUserid();
		}
		//get my used
		List<Used> usedlist = myUsedService.getMyUsed(userid);
		model.addAttribute("usedlist", usedlist);
		//get my attention used
		List<Used> attentionUsed = new ArrayList<Used>();
		List<UsedAttention> usedAttentions = usedAttentionService.queryAttentionUsedid(userid);
		for (UsedAttention usedAttention : usedAttentions) {
			Used used = myUsedService.selectUsed(usedAttention.getUsedid());
			attentionUsed.add(used);
		}
		model.addAttribute("attentionUsed", attentionUsed);
		return "my_used";
	}
	
	/**
	 * delete myself used
	 * @param usedid
	 * @return
	 */
	@RequestMapping(value="/removemyselfused/{usedid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyUsed(@PathVariable("usedid")Integer usedid){
		//delete my used 
		myUsedService.deleteMyUsed(usedid);
		//删除used时，将used reply一并删除
		usedReplyService.deleteMyUsed(usedid);
		return Msg.success();
	}
}
