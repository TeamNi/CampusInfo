package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Advertisement;
import com.njl.bean.AdvertisementExample;
import com.njl.bean.AdvertisementExample.Criteria;
import com.njl.dao.AdvertisementMapper;

/**
 * advertisement service
 * @author njl
 *
 */
@Service
public class AdvertisementService {
	
	@Autowired
	private AdvertisementMapper advertisementMapper;

	/**
	 * issue advertisement
	 * @param advertisement
	 */
	public void issueAdvertisement(Advertisement advertisement) {
		// TODO Auto-generated method stub
		advertisementMapper.insertSelective(advertisement);
	}

	/**
	 * get advertisement
	 * @return
	 */
	public List<Advertisement> getAdvertisement() {
		// TODO Auto-generated method stub
		AdvertisementExample example = new AdvertisementExample();
		example.setOrderByClause("createtime");
		List<Advertisement> advertisementlist = advertisementMapper.selectByExampleWithUser(example);
		return advertisementlist;
	}

	/**
	 * check advertisement
	 * @param advertisement
	 */
	public void updateNotification(Advertisement advertisement) {
		// TODO Auto-generated method stub
		advertisementMapper.updateByPrimaryKeySelective(advertisement);
	}

	/**
	 * get condition pass advertisement
	 * @return
	 */
	public List<Advertisement> getPassAdvertisement() {
		// TODO Auto-generated method stub
		AdvertisementExample example = new AdvertisementExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		// 1:pass 2:fail 0: no check
		criteria.andConditionckEqualTo(1);
		List<Advertisement> advertisementlist = advertisementMapper.selectByExampleWithUser(example);
		return advertisementlist;
	}

}
