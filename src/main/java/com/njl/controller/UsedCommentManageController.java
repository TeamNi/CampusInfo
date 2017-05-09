package com.njl.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Msg;
import com.njl.bean.UsedReply;
import com.njl.service.UsedReplyService;

/**
 * 对used评论管理的CRUD
 * @author njl
 *
 */
@Controller
public class UsedCommentManageController {
	
	@Autowired
	UsedReplyService usedReplyService;
	
	/**
	 * 查询Used Reply数据
	 * @return
	 */
	@RequestMapping("/manage_comment_used")
	public String getUsedReply(Model model){
		List<UsedReply> replylist = usedReplyService.getAll();
		model.addAttribute("replylist", replylist);
		return "manage_comment_used";
	}
	
	/**
	 * delete used reply 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/usedReply/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteReply(@PathVariable("id") Integer id){
		usedReplyService.deleteUsedReply(id);
		return Msg.success();
	}
	
	/**
	 * update used reply
	 * @param usedReply
	 * @return
	 */
	@RequestMapping(value="/usedReply/{replyid}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateUsedReply(UsedReply usedReply){
		usedReplyService.updateUsedReply(usedReply);
		return Msg.success();
	}
	
	/**
	 * add used reply
	 * @param usedReply
	 * @return
	 */
	@RequestMapping(value="/usedReply",method = RequestMethod.POST)
	@ResponseBody
	public Msg addUsedReply(UsedReply usedReply){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		usedReply.setCreatetime(date);
		usedReplyService.addUsedReply(usedReply);
		return Msg.success();
	}
}
