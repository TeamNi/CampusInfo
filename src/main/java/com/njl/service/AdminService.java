package com.njl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.AdminExample;
import com.njl.bean.AdminExample.Criteria;
import com.njl.dao.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	/**
	 * admin login
	 * @param user
	 * @return 
	 */
	public long queryAdmin(String username,String password) {
		// TODO Auto-generated method stub
		AdminExample example = new AdminExample();
		Criteria  criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username).andPasswordEqualTo(password);
		long count = adminMapper.countByExample(example);
		return count;
	}

}
