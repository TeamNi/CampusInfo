package com.njl.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.njl.bean.Admin;
import com.njl.bean.User;
import com.njl.dao.AdminMapper;
import com.njl.dao.UserMapper;

/**
 * 测试dao
 * @author njl
 *使用Spring的单元测试，可以自动注入我们的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位置
 *3、直接Autowired要使用的组件
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

//	@Autowired
//	AdminMapper adminMapper;
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试admin
	 */
	@Test
	public void testCRUD(){
		/*//1、创建SpringIOC容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2、从容器中获取mapper
		AdminMapper bean = ioc.getBean(AdminMapper.class);*/
		
		long time = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(time);
		System.out.println(userMapper);
		
		//adminMapper.insertSelective(new Admin(null, "nijilong2", "manager", "password"));
		//adminMapper.deleteByPrimaryKey(2);
		//adminMapper.updateByPrimaryKeySelective(new Admin(1, "nijilong", "admin", "password"));
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		for(int i = 0 ; i < 10 ; i ++){
			String username = UUID.randomUUID().toString().substring(0, 5);
			String nickname = username + i;
			mapper.insertSelective(new User(null, username, nickname, 13170700+i, "abcd@1234", date, "你的学校", "沈阳化工大学", null, "88888888", "美丽动人"));
		}
		System.out.println("SUCCESSFUL!");
	}
	
}
