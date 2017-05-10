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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Blog;
import com.njl.bean.BlogReply;
import com.njl.bean.Msg;
import com.njl.service.BlogReplyService;
import com.njl.service.BlogService;

/**
 * 前台  blog 
 * @author njl
 *
 */
@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogReplyService blogReplyService;
	
	/**
	 * blog 首页
	 * @return
	 */
	@RequestMapping("/blog")
	public String getBlog(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model) {
		//引入PageHelper分页插件
		//在查询之前只需要调用
		PageHelper.startPage(pn, 4);
		//startPage后面紧跟的查询 就是一个分页查询
		List<Blog> bloglist = blogService.getBlog();
		//使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行
		//它封装了详细的分页数据，包括我们查询出来的数据。传入连续显示的页数
		PageInfo page = new PageInfo(bloglist,5);
		model.addAttribute("pageInfo", page);
		return "blog";
	}
	
	/**
	 * blog details
	 * @return
	 */
	@RequestMapping("/blog_details")
	 public String getBlogDetails(@RequestParam("blogid")Integer blogid, Model model) {
		//blog details
		Blog blogdetails = blogService.getBlogDetails(blogid);
		model.addAttribute("blogdetails", blogdetails);
		//blog reply
		List<BlogReply> replylist = blogReplyService.getBlogReply(blogid);
		model.addAttribute("replylist", replylist);
		return "blog_details";
	}
	
	/**
	 * remove my reply
	 * @param replyid
	 * @param blogid
	 * @return
	 */
	@RequestMapping(value="/removeblogreply/{replyid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyReply(@PathVariable("replyid") Integer replyid){
		//delete my reply
		BlogReply blog = blogReplyService.queryBlogid(replyid);
		int blogid = blog.getBlogid();
		blogReplyService.deleteReply(replyid);
		//统计评论数
		System.out.println(replyid+"====="+blogid);
		int count = (int)blogReplyService.countReply(blogid);
		System.out.println(count);
		Blog blogreplytimes = new Blog();
		blogreplytimes.setReplytimes(count);
		blogService.updateReplytimes(blogreplytimes,blogid);
		return Msg.success();
	}
	
	/**
	 * blog issue
	 * @return
	 */
	@RequestMapping("/blog_issue")
	public String getBlogIssue() {
		return "blog_issue";
	}
}
