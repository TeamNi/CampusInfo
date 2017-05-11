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
	 * @param friendid
	 * @param userid
	 */
	public void deleteFriend(Integer friendid,Integer userid) {
		// TODO Auto-generated method stub
		UserAttentionExample example = new UserAttentionExample();
		Criteria criteria = example.createCriteria();
		criteria.andFriendidEqualTo(friendid).andUseridEqualTo(userid);
		userAttentionMapper.deleteByExample(example);
	}

	/**
	 * 查看好友是否已经存在
	 * @param userid
	 * @param friendid
	 * @return
	 */
	public long selectFrient(int userid, Integer friendid) {
		// TODO Auto-generated method stub
		UserAttentionExample example = new UserAttentionExample();
		Criteria  criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid).andFriendidEqualTo(friendid);
		long count = userAttentionMapper.countByExample(example);
		return count;
	}

	/**
	 * add frieng
	 * @param userAttention
	 */
	public void addFriend(UserAttention userAttention) {
		// TODO Auto-generated method stub
		userAttentionMapper.insert(userAttention);
	}
}
