package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Blog;
import com.njl.bean.BlogExample;
import com.njl.bean.BlogExample.Criteria;
import com.njl.dao.BlogMapper;

/**
 * my blog service
 * @author njl
 *
 */
@Service
public class MyBlogService {
	
	@Autowired
	BlogMapper blogMapper;

	/**
	 * get my blog
	 * @param userid
	 * @return
	 */
	public List<Blog> getMyblog(int userid) {
		// TODO Auto-generated method stub
		BlogExample example = new BlogExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Blog> bloglist = blogMapper.selectByExample(example);
		return bloglist;
	}

	/**
	 * delete myself blog
	 * @param blogid
	 */
	public void removeMyBlog(Integer blogid) {
		// TODO Auto-generated method stub
		blogMapper.deleteByPrimaryKey(blogid);
	}
}
