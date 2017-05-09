package com.njl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UserExample;
import com.njl.bean.UserExample.Criteria;
import com.njl.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	/**
	 * user login
	 * @param user
	 */
	public long queryUser(String username,String password) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPasswordEqualTo(password).andUsernameEqualTo(username);
		long count = userMapper.countByExample(example);
		return count;
	}

}
