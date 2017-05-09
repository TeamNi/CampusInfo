package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UsedReply;
import com.njl.dao.UsedReplyMapper;

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

}
