package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.BlogPic;
import com.njl.bean.BlogPicExample;
import com.njl.bean.BlogPicExample.Criteria;
import com.njl.dao.BlogPicMapper;

/**
 * blog picture
 * @author njl
 *
 */
@Service
public class BlogPicService {

	@Autowired
	private BlogPicMapper blogPicMapper;
	
	/**
	 * add blog picture
	 * @param blogPic
	 */
	public void addBlogPic(BlogPic blogPic) {
		// TODO Auto-generated method stub
		blogPicMapper.insertSelective(blogPic);
	}

	/**
	 * blog details page picture show
	 * @param blogid
	 * @return
	 */
	public List<BlogPic> queryPic(Integer blogid) {
		// TODO Auto-generated method stub
		BlogPicExample example = new BlogPicExample();
		Criteria criteria = example.createCriteria();
		criteria.andBlogidEqualTo(blogid);
		List<BlogPic> blogPics = blogPicMapper.selectByExample(example);
		return blogPics;
	}

	/**
	 * delete pic with blogid
	 * @param blogid
	 */
	public void deletePicWithBlogid(Integer blogid) {
		// TODO Auto-generated method stub
		BlogPicExample example = new BlogPicExample();
		Criteria criteria = example.createCriteria();
		criteria.andBlogidEqualTo(blogid);
		blogPicMapper.deleteByExample(example);
	}
}
