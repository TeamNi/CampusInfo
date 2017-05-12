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
import com.njl.bean.Used;
import com.njl.bean.UsedAttention;
import com.njl.bean.User;
import com.njl.service.UsedAttentionService;
import com.njl.service.UsedService;
import com.njl.service.UserService;

@Controller
@SessionAttributes({"username","studentid"})
public class UsedAttetionController {

	@Autowired
	private UsedAttentionService usedAttentionService;
	@Autowired
	private UsedService  usedService;
	@Autowired
	private UserService userService;
	
	/**
	 * add my attention used
	 * @param usedid
	 * @param studentid
	 * @return
	 */
	@RequestMapping(value="/addattention",method=RequestMethod.POST)
	@ResponseBody
	public Msg addAttentionUsed(@RequestParam("usedid")Integer usedid,@ModelAttribute("studentid")Integer studentid){
		//根据学号拿到userid
		int userid = 0;
		List<User> userlist = userService.queryUserWithStu(studentid);
		for (User user : userlist) {
			userid = user.getUserid();
		}
		//查看used是否为我自己发布的used
		Used useduser = usedService.queryWithUsedid(usedid);
		if(useduser.getUserid() == userid){
			return Msg.fail().add("info", "自己发布的物品不能添加到我的关注中！");
		}
		//查看used是否已经在我的关注中
		long num = usedAttentionService.selectAttention(userid,usedid);
		if(num > 0){
			return Msg.fail().add("info", "此物品已经在我的关注中!");
		}else{
			//转载数据
			UsedAttention usedAttention = new UsedAttention();
			usedAttention.setUsedid(usedid);
			usedAttention.setUserid(userid);
			//add attention used
			usedAttentionService.addAttentionUsed(usedAttention);
			//更新used 表中attentiontimes 的值 
			int count = (int)usedAttentionService.countAttention(usedid);
			Used used = new Used();
			used.setAttentiontimes(count);
			usedService.updateTimes(used, usedid);
			return Msg.success();
		}
	}
	
	/**
	 * delete my attention used
	 * @param usedid
	 * @return
	 */
	@RequestMapping(value="/removemyattentionused/{usedid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyAttentionUsed(@PathVariable("usedid")Integer usedid,@ModelAttribute("studentid")Integer studentid){
		//根据studentid 获得userid
		int userid = 0;
		List<User> userlist = userService.queryUserWithStu(studentid);
		for (User user : userlist) {
			userid = user.getUserid();
		}
		//delete my attention used 
		usedAttentionService.deleteMyAttention(userid, usedid);
		//更新used 表中attentiontimes 的值 
		int count = (int)usedAttentionService.countAttention(usedid);
		Used used = new Used();
		used.setAttentiontimes(count);
		usedService.updateTimes(used, usedid);
		return Msg.success();
	}
}
