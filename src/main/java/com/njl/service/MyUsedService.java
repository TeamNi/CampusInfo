package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Used;
import com.njl.bean.UsedExample;
import com.njl.bean.UsedExample.Criteria;
import com.njl.dao.UsedMapper;

/**
 * my used service
 * @author njl
 *
 */
@Service
public class MyUsedService {

	@Autowired
	UsedMapper usedMapper;
	
	/**
	 * get my used
	 * @param userid
	 * @return
	 */
	public List<Used> getMyUsed(int userid) {
		// TODO Auto-generated method stub
		UsedExample example = new UsedExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Used> usedlist = usedMapper.selectByExample(example);
		return usedlist;
	}

	/**
	 * delete my used
	 * @param usedid
	 */
	public void deleteMyUsed(Integer usedid) {
		// TODO Auto-generated method stub
		usedMapper.deleteByPrimaryKey(usedid);
	}

	/**
	 * get used with usedid
	 * @param usedid
	 * @return
	 */
	public Used selectUsed(Integer usedid) {
		// TODO Auto-generated method stub
		Used used = usedMapper.selectByPrimaryKey(usedid);
		return used;
	}

}
