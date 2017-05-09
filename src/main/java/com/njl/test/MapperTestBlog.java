package com.njl.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.njl.bean.Blog;
import com.njl.dao.BlogMapper;

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
public class MapperTestBlog {

	@Autowired
	BlogMapper blogMapper;
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试admin
	 */
	@Test
	public void testCRUD(){
		long time = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(time);
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		String datetime = df.format(date);
//		System.out.println(datetime);
		System.out.println(blogMapper);
		
		BlogMapper mapper = sqlSession.getMapper(BlogMapper.class);
		for(int i = 0 ; i < 20 ; i ++){
			String string = UUID.randomUUID().toString().substring(0, 5);
			String title = "Hello here will be some recent news.." + string;
			String content = string + i +"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ";
			mapper.insertSelective(new Blog(null, i+1, date, title, content, null, 5));
		}
		System.out.println("SUCCESSFUL!");
	}
	
}
