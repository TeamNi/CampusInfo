package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Blog;
import com.njl.dao.BlogMapper;

@Service
public class BlogManageService {
	
	@Autowired
	BlogMapper blogMapper;

	/**
	 * 查询所有blog
	 * @return
	 */
	public List<Blog> getAll() {
		// TODO Auto-generated method stub
		return blogMapper.selectByExample(null);
	}

	/**
	 * 删除blog
	 * @param id
	 */
	public void deleteBlog(Integer id) {
		// TODO Auto-generated method stub
		blogMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 增加blog
	 * @param blog
	 */
	public void addBlog(Blog blog) {
		// TODO Auto-generated method stub
		blogMapper.insertSelective(blog);
	}

	/**
	 * 修改blog
	 * @param blog
	 */
	public void updateBlog(Blog blog) {
		// TODO Auto-generated method stub
		blogMapper.updateByPrimaryKeySelective(blog);
	}

}
