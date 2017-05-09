package com.njl.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回的类
 * 
 * @author njl
 *
 */
public class Msg {

	// 状态吗1-成功 2-失败
	private int code;
	// 提示信息
	private String msg;
	// 用户要返回给浏览器的数据
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public static Msg success(){
		Msg result = new Msg();
		result.setCode(1);
		result.setMsg("成功！");
		return result;
	}
	
	public static Msg fail(){
		Msg result = new Msg();
		result.setCode(2);
		result.setMsg("失败！");
		return result;
	}
	
	//链式操作
	public Msg add(String key,Object value){
		this.getExtend().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
