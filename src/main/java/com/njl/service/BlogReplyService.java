package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.BlogReply;
import com.njl.dao.BlogReplyMapper;

@Service
public class BlogReplyService {

	@Autowired
	BlogReplyMapper blogReplyMapper;

	/**
	 * 查询全部论坛回复数据
	 * @return
	 */
	public List<BlogReply> getAll() {
		// TODO Auto-generated method stub
		return blogReplyMapper.selectByExample(null);
	}

	/**
	 * delete blog reply
	 * @param id
	 */
	public void deleteReply(Integer id) {
		// TODO Auto-generated method stub
		blogReplyMapper.deleteByPrimaryKey(id);
	}

	/**
	 * add blog reply
	 * @param blogReply
	 */
	public void addBlogReply(BlogReply blogReply) {
		// TODO Auto-generated method stub
		blogReplyMapper.insertSelective(blogReply);
	}

	/**
	 * update blog reply
	 * @param blogReply
	 */
	public void updateBlogReply(BlogReply blogReply) {
		// TODO Auto-generated method stub
		blogReplyMapper.updateByPrimaryKeySelective(blogReply);
	}
}
