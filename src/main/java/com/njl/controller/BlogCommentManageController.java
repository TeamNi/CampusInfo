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

import com.njl.bean.BlogReply;
import com.njl.bean.Msg;
import com.njl.service.BlogReplyService;

/**
 * 对论坛评论管理的CRUD
 * @author njl
 *
 */
@Controller
public class BlogCommentManageController {

	@Autowired
	BlogReplyService blogReplyService;
	
	/**
	 * 查询论坛评论数据
	 * @return
	 */
	@RequestMapping("/manage_comment_blog")
	public String getBlogReply(Model model){
		List<BlogReply> replylist = blogReplyService.getAll();
		model.addAttribute("replylist", replylist);
		return "manage_comment_blog";
	}
	
	/**
	 * 删除blog reply 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/blogReply/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteReply(@PathVariable("id") Integer id){
		blogReplyService.deleteReply(id);
		return Msg.success();
	}
	
	/**
	 * update blog reply
	 * @param blogReply
	 * @return
	 */
	@RequestMapping(value="/blogReply/{replyid}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateBlogReply(BlogReply blogReply){
		blogReplyService.updateBlogReply(blogReply);
		return Msg.success();
	}
	
	/**
	 * add blog reply
	 * @param blogReply
	 * @return
	 */
	@RequestMapping(value="/blogReply",method = RequestMethod.POST)
	@ResponseBody
	public Msg addBlogReply(BlogReply blogReply){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		blogReply.setCreatetime(date);
		blogReplyService.addBlogReply(blogReply);
		return Msg.success();
	}

}
