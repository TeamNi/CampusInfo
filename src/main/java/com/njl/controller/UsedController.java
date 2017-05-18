package com.njl.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Msg;
import com.njl.bean.Used;
import com.njl.bean.UsedReply;
import com.njl.bean.User;
import com.njl.service.UsedReplyService;
import com.njl.service.UsedService;

/**
 * 前台 used
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class UsedController {
	
	@Autowired
	private UsedService usedService;
	@Autowired
	private UsedReplyService usedReplyService;

	/**
	 * to used page 首页
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/used")
	public String getUsed(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model) {
		//分页
		PageHelper.startPage(pn, 9);
		//get all used
		List<Used> usedlist = usedService.getUsed();
		PageInfo<Used> pageInfo = new PageInfo<Used>(usedlist, 5);
		model.addAttribute("pageInfo", pageInfo);
		return "used";
	}
	
	/**
	 * to used details page
	 * @param usedid
	 * @param model
	 * @return
	 */
	@RequestMapping("/used_details")
	public String getUsedDetails(@RequestParam("usedid")Integer usedid,Model model) {
		//get used details
		Used useddetails = usedService.getUsedDetails(usedid);
		model.addAttribute("useddetails", useddetails);
		//get used reply
		List<UsedReply> replylist = usedReplyService.getUsedReply(usedid);
		model.addAttribute("replylist", replylist);
		return "used_details";
	}
	
	/**
	 * add used reply
	 * @param usedReply
	 * @param studentid
	 * @return
	 */
	@RequestMapping(value="/addusedreply",method=RequestMethod.POST)
	@ResponseBody
	public Msg addUsedReply(UsedReply usedReply,@ModelAttribute("myself") User userinfo){
		usedReply.setUserid(userinfo.getUserid());
		//获取时间
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		usedReply.setCreatetime(date);
		usedReplyService.addUsedReply(usedReply);
		//统计评论数
		int usedid = usedReply.getUsedid();
		int count = (int)usedReplyService.countReply(usedid);//从 usedreply表中查出reply count
		Used usedreplytimes = new Used();
		usedreplytimes.setReplytimes(count);
		usedService.updateTimes(usedreplytimes,usedid);//update replytimes
		return Msg.success();
	}
	
	/**
	 * delete myself replytimes
	 * @param replyid
	 * @return
	 */
	@RequestMapping(value="/removeusedreply/{replyid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeusedreply(@PathVariable("replyid") Integer replyid){
		UsedReply usedReply = usedReplyService.queryUsedid(replyid);
		int usedid = usedReply.getUsedid();
		//delete used reply
		usedReplyService.deleteUsedReply(replyid);
		//统计评论数
		int count = (int)usedReplyService.countReply(usedid);//从 usedreply表中查出reply count
		Used used = new Used();
		used.setReplytimes(count);
		usedService.updateTimes(used, usedid);//update replytimes
		return Msg.success();
	}
	
	/**
	 * to used issue page
	 * @return
	 */
	@RequestMapping("/used_issue")
	public String getUsedIssue(){
		return "used_issue";
	}
	
	@RequestMapping(value="/issue_used",method=RequestMethod.POST)
	@ResponseBody
	public Msg issueUsed(Used used,@ModelAttribute("myself")User userinfo){
		used.setUserid(userinfo.getUserid());
		//获取当前时间
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		used.setCreatetime(date);
		//add used
		usedService.addUsed(used);
		return Msg.success();
	}
}
