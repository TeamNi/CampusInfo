package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UsedAttention;
import com.njl.bean.UsedAttentionExample;
import com.njl.bean.UsedAttentionExample.Criteria;
import com.njl.dao.UsedAttentionMapper;

/**
 * my attention used service
 * @author njl
 *
 */
@Service
public class UsedAttentionService {
	
	@Autowired
	UsedAttentionMapper usedAttentionMapper;

	/**
	 * add attention used
	 * @param usedAttention
	 */
	public void addAttentionUsed(UsedAttention usedAttention) {
		// TODO Auto-generated method stub
		usedAttentionMapper.insertSelective(usedAttention);
	}

	/**
	 * query used attentiontimes
	 * @param usedid
	 * @return
	 */
	public long countAttention(Integer usedid) {
		// TODO Auto-generated method stub
		UsedAttentionExample example = new UsedAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		long count = usedAttentionMapper.countByExample(example);
		return count;
	}

	/**
	 * 查看used是否已经在我的关注中
	 * @param userid
	 * @param usedid
	 * @return
	 */
	public long selectAttention(int userid, Integer usedid) {
		// TODO Auto-generated method stub
		UsedAttentionExample example = new UsedAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid).andUseridEqualTo(userid);
		long num = usedAttentionMapper.countByExample(example);
		return num;
	}

	/**
	 * query my attention
	 * @param userid
	 * @return
	 */
	public List<UsedAttention> queryAttentionUsedid(int userid) {
		// TODO Auto-generated method stub
		UsedAttentionExample example = new UsedAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<UsedAttention> usedAttentions = usedAttentionMapper.selectByExample(example);
		return usedAttentions;
	}

	/**
	 * delete my attention
	 * @param userid
	 * @param usedid
	 */
	public void deleteMyAttention(int userid, Integer usedid) {
		// TODO Auto-generated method stub
		UsedAttentionExample example = new UsedAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid).andUsedidEqualTo(usedid);
		usedAttentionMapper.deleteByExample(example);
	}
}
