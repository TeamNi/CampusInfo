package com.njl.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.njl.bean.User;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

/**
 * 使用Spring测试模块提供的测试请求功能，测试CRUD请求的正确性
 * 
 * @author njl
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MvcTest {
	// 传入SpringMvc的IOC
	@Autowired
	WebApplicationContext context;

	// 虚拟MVC请求，获取到处理结果。
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testUser() throws Exception {
		//模拟请求拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/manageuser")).andReturn();
		
		//获取员工数据
		MockHttpServletRequest request = result.getRequest();
		List<User> list = (List<User>) request.getAttribute("userList");
		int i = 0;
		for(User user : list){
			i ++;
			System.out.println("姓名：" + user.getUsername() + "====合计：" + i);
			
		}
	}
}
