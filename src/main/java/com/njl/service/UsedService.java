package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Used;
import com.njl.bean.UsedExample;
import com.njl.bean.UsedExample.Criteria;
import com.njl.dao.UsedMapper;

/**
 * used service
 * @author njl
 *
 */
@Service
public class UsedService {
	
	@Autowired
	UsedMapper usedMapper;

	/**
	 * get all used
	 * @return
	 */
	public List<Used> getUsed() {
		// TODO Auto-generated method stub
		UsedExample example = new UsedExample();
		example.setOrderByClause("createtime");
		List<Used> usedlist = usedMapper.selectByExampleWithUser(example);
		return usedlist;
	}

	/**
	 * get used details
	 * @param usedid
	 * @return
	 */
	public Used getUsedDetails(Integer usedid) {
		// TODO Auto-generated method stub
		Used used = usedMapper.selectByPrimaryKeyWithUser(usedid);
		return used;
	}

	/**
	 * 更新评论数
	 * @param usedreplytimes
	 * @param usedid
	 */
	public void updateTimes(Used usedreplytimes, int usedid) {
		// TODO Auto-generated method stub
		UsedExample example = new UsedExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		usedMapper.updateByExampleSelective(usedreplytimes, example);
	}

	/**
	 * issue used
	 * @param used
	 */
	public void addUsed(Used used) {
		// TODO Auto-generated method stub
		usedMapper.insertSelective(used);
	}

	/**
	 * 查看used是否为我自己发布的used
	 * @param usedid
	 * @return
	 */
	public Used queryWithUsedid(Integer usedid) {
		// TODO Auto-generated method stub
		Used used = usedMapper.selectByPrimaryKey(usedid);
		return used;
	}
}
