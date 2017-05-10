package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Blog;
import com.njl.bean.BlogExample;
import com.njl.bean.BlogExample.Criteria;
import com.njl.dao.BlogMapper;

@Service
public class BlogService {

	@Autowired
	private BlogMapper blogMapper;

	/**
	 * get blog
	 * 
	 * @return
	 */
	public List<Blog> getBlog() {
		// TODO Auto-generated method stub
		BlogExample example = new BlogExample();
		example.setOrderByClause("createtime");
		List<Blog> bloglist = blogMapper.selectByExample(example);
		return bloglist;
	}

	/**
	 * get blog details
	 * 
	 * @param blogid
	 * @return
	 */
	public Blog getBlogDetails(Integer blogid) {
		// TODO Auto-generated method stub
		Blog blogdetails = blogMapper.selectByPrimaryKey(blogid);
		return blogdetails;
	}

	/**
	 * update replytimes
	 * @param count
	 */
	public void updateReplytimes(Blog blogreplytimes, Integer blogid) {
		// TODO Auto-generated method stub
		BlogExample example = new BlogExample();
		Criteria criteria = example.createCriteria();
		criteria.andBlogidEqualTo(blogid);
		blogMapper.updateByExampleSelective(blogreplytimes, example);
	}
}
