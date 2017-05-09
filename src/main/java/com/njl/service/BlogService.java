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
	 * @return
	 */
	public List<Blog> getBlog() {
		// TODO Auto-generated method stub
		BlogExample example = new BlogExample();
		Criteria criteria = example.createCriteria();
		criteria.andCreatetimeIsNotNull();
		List<Blog> bloglist = blogMapper.selectByExample(example);
		return bloglist;
	}

}
