package com.njl.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Blog;
import com.njl.bean.BlogReply;
import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.service.BlogReplyService;
import com.njl.service.BlogService;

/**
 * 前台  blog 
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself"})
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogReplyService blogReplyService;
	
	/**
	 * blog 首页
	 * @param pn
	 * @param model
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
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(bloglist,5);
		model.addAttribute("pageInfo", pageInfo);
		return "blog";
	}
	
	/**
	 * to blog details page
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
		BlogReply blog = blogReplyService.queryBlogid(replyid);
		int blogid = blog.getBlogid();
		//delete my reply
		blogReplyService.deleteReply(replyid);
		//统计评论数
		int count = (int)blogReplyService.countReply(blogid);
		Blog blogreplytimes = new Blog();
		blogreplytimes.setReplytimes(count);
		blogService.updateReplytimes(blogreplytimes,blogid);
		return Msg.success();
	}
	
	/**
	 * add blog reply
	 * @param blogReply
	 * @return
	 */
	@RequestMapping(value="/addblogreply",method=RequestMethod.POST)
	@ResponseBody
	public Msg addBlogReply(BlogReply blogReply,@ModelAttribute("myself") User userinfo){
		//将数据装载到BlogReply
		blogReply.setUserid(userinfo.getUserid());
		//获取时间
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		blogReply.setCreatetime(date);
		blogReplyService.addBlogReply(blogReply);//add reply
		//统计评论数
		int blogid = blogReply.getBlogid();
		int count = (int)blogReplyService.countReply(blogid);
		Blog blogreplytimes = new Blog();
		blogreplytimes.setReplytimes(count);
		blogService.updateReplytimes(blogreplytimes,blogid);//update replytimes
		return Msg.success();
	}
	
	/**
	 * to blog issue page
	 * @return
	 */
	@RequestMapping("/blog_issue")
	public String toBlogIssuePage() {
		return "blog_issue";
	}
	
	/**
	 * issue blog
	 * @param blog
	 * @param studentid
	 * @return
	 */
	@RequestMapping(value="/issue_blog",method=RequestMethod.POST)
	@ResponseBody
	public Msg issueBlog(Blog blog,@ModelAttribute("myself") User userinfo){
		//获取当前时间
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		//issue blog
		blog.setUserid(userinfo.getUserid());
		blog.setCreatetime(date);
		blogService.issueBlog(blog);
		return Msg.success(); 
	}
	
	@RequestMapping(value="/uploadblogpicture",method=RequestMethod.POST)
	@ResponseBody
	public Msg uploadBlobPicture(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		System.out.println("0000");
		System.out.println(file);
		String fileName = file .getOriginalFilename();//文件原名称
		file.transferTo(new File(request.getSession().getServletContext().getRealPath("/") + "image/" + String.valueOf(System.currentTimeMillis()) + fileName));
		return Msg.success();
	}
}
