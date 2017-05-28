package com.njl.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Blog;
import com.njl.bean.BlogPic;
import com.njl.bean.Msg;
import com.njl.service.BlogManageService;
import com.njl.service.BlogPicService;
import com.njl.service.BlogReplyService;

/**
 * 对论坛管理的CRUD
 * @author njl
 *
 */
@Controller
public class BlogManageController {
	
	@Autowired
	BlogManageService blogManageService;
	@Autowired
	private BlogPicService blogPicService;
	@Autowired
	private BlogReplyService blogReplyservice;
	
	/**
	 * 查询论坛数据
	 * @return
	 */
	@RequestMapping("/manage_blog")
	public String getBlog(Model model){
		List<Blog> bloglist = blogManageService.getAll();
		model.addAttribute("bloglist", bloglist);
		return "manage_blog";
	}
	
	/**
	 * 删除blog
	 * @return
	 */
	@RequestMapping(value="/blog/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteBlog(@PathVariable("id") Integer id, HttpServletRequest request){
		//删除blog 时  将服务器上的图片一并删除
		List<BlogPic> picslist = blogPicService.queryPic(id);
		for (BlogPic blogPic : picslist) {
			File picFile = new File(request.getSession().getServletContext().getRealPath("/") + blogPic.getPictureurl());
			if(picFile.exists() && (!"image/blog/1495195501805noimage.png".equals(blogPic.getPictureurl()))){
				picFile.delete();
			}
		}
		//delete blogPic database data
		blogPicService.deletePicWithBlogid(id);
		//删除blog时，将blog reply一并删除
		blogReplyservice.deleteReplyWithBlogid(id);
		//删除blog
		blogManageService.deleteBlog(id);
		return Msg.success();
	}
	
	/**
	 * update blog
	 * @param blog
	 * @return
	 */
	@RequestMapping(value="/blog/{blogid}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateBlog(Blog blog){
		blogManageService.updateBlog(blog);
		return Msg.success();
	}

	/**
	 * 增加blog
	 * @return
	 */
	@RequestMapping(value="blog",method = RequestMethod.POST)
	@ResponseBody
	public Msg addBlog(Blog blog){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		blog.setCreatetime(date);
		blogManageService.addBlog(blog);
		return Msg.success();
	}
	
}
