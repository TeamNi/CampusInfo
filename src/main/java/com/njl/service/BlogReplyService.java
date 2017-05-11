package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Blog;
import com.njl.bean.BlogReply;
import com.njl.bean.BlogReplyExample;
import com.njl.bean.BlogReplyExample.Criteria;
import com.njl.dao.BlogReplyMapper;

/**
 * blog reply service
 * @author njl
 *
 */
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

	/**
	 * get blog reply for blog details page
	 * @param blogid
	 * @return
	 */
	public List<BlogReply> getBlogReply(Integer blogid) {
		// TODO Auto-generated method stub
		BlogReplyExample example = new BlogReplyExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		criteria.andBlogidEqualTo(blogid);
		List<BlogReply> replylist = blogReplyMapper.selectByExampleWithUser(example);
		return replylist;
	}

	/**
	 * 统计评论数
	 * @param blogid
	 */
	public long countReply(Integer blogid) {
		// TODO Auto-generated method stub
		BlogReplyExample example = new BlogReplyExample();
		Criteria criteria = example.createCriteria();
		criteria.andBlogidEqualTo(blogid);
		long count = blogReplyMapper.countByExample(example);
		return count;
	}

	/**
	 * get blogid from blogreply witn relpyid
	 * @param replyid
	 * @return
	 */
	public BlogReply queryBlogid(Integer replyid) {
		// TODO Auto-generated method stub
		BlogReply blog = blogReplyMapper.selectByPrimaryKey(replyid);
		return blog;
	}
}
