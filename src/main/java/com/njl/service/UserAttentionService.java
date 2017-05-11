package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UserAttention;
import com.njl.bean.UserAttentionExample;
import com.njl.bean.UserAttentionExample.Criteria;
import com.njl.dao.UserAttentionMapper;

/**
 * user attention service
 * @author njl
 *
 */
@Service
public class UserAttentionService {

	@Autowired
	UserAttentionMapper userAttentionMapper;

	/**
	 * get my attention
	 * @param userid
	 * @return
	 */
	public List<UserAttention> getMyAttention(int userid) {
		// TODO Auto-generated method stub
		UserAttentionExample example = new UserAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<UserAttention> attentions = userAttentionMapper.selectByExample(example);
		return attentions;
	}

	/**
	 * delete friend
	 * @param id
	 */
	public void deleteFriend(Integer friendid,Integer userid) {
		// TODO Auto-generated method stub
		UserAttentionExample example = new UserAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andFriendidEqualTo(friendid).andUseridEqualTo(userid);
		userAttentionMapper.deleteByExample(example);
	}
}
