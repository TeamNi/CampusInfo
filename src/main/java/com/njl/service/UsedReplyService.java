package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UsedReply;
import com.njl.bean.UsedReplyExample;
import com.njl.bean.UsedReplyExample.Criteria;
import com.njl.dao.UsedReplyMapper;

/**
 * used reply service
 * @author njl
 *
 */
@Service
public class UsedReplyService {

	@Autowired
	UsedReplyMapper usedReplyMapper;
	
	/**
	 * 查询Used Reply数据
	 * @return
	 */
	public List<UsedReply> getAll() {
		// TODO Auto-generated method stub
		return usedReplyMapper.selectByExample(null);
	}

	/**
	 * delete used reply
	 * @param id
	 */
	public void deleteUsedReply(Integer id) {
		// TODO Auto-generated method stub
		usedReplyMapper.deleteByPrimaryKey(id);
	}

	/**
	 * add used reply
	 * @param usedReply
	 */
	public void addUsedReply(UsedReply usedReply) {
		// TODO Auto-generated method stub
		usedReplyMapper.insertSelective(usedReply);
	}

	/**
	 * update used reply
	 * @param usedReply
	 */
	public void updateUsedReply(UsedReply usedReply) {
		// TODO Auto-generated method stub
		usedReplyMapper.updateByPrimaryKeySelective(usedReply);
	}

	/**
	 * get used reply
	 * @param usedid
	 * @return
	 */
	public List<UsedReply> getUsedReply(Integer usedid) {
		// TODO Auto-generated method stub
		UsedReplyExample example = new UsedReplyExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		List<UsedReply> replylist = usedReplyMapper.selectByExampleWithUser(example);
		return replylist;
	}

	/**
	 * 统计used 评论数
	 * @param usedid
	 * @return
	 */
	public long countReply(int usedid) {
		// TODO Auto-generated method stub
		UsedReplyExample example = new UsedReplyExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		long count = usedReplyMapper.countByExample(example);
		return count;
	}

	/**
	 * get usedid with replyid
	 * @param replyid
	 * @return
	 */
	public UsedReply queryUsedid(Integer replyid) {
		// TODO Auto-generated method stub
		UsedReply usedReply = usedReplyMapper.selectByPrimaryKey(replyid);
		return usedReply;
	}

	/**
	 * delete blog reply with blogid
	 * 删除blog时，将blog reply一并删除
	 * @param usedid
	 */
	public void deleteMyUsed(Integer usedid) {
		// TODO Auto-generated method stub
		UsedReplyExample example = new UsedReplyExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		usedReplyMapper.deleteByExample(example);
	}
}
