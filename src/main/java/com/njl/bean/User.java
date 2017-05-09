package com.njl.bean;

import java.util.Date;

public class User {
    private Integer userid;

    private String username;

    private String nickname;

    private Integer studentid;

    private String password;

    private Date createtime;

    private String safequestion;

    private String safeanswer;

    private String headurl;

    private String contact;

    private String sex;
    
    public User() {
		super();
	}

	public User(Integer userid, String username, String nickname, Integer studentid, String password, Date createtime,
			String safequestion, String safeanswer, String headurl, String contact, String sex) {
		super();
		this.userid = userid;
		this.username = username;
		this.nickname = nickname;
		this.studentid = studentid;
		this.password = password;
		this.createtime = createtime;
		this.safequestion = safequestion;
		this.safeanswer = safeanswer;
		this.headurl = headurl;
		this.contact = contact;
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", nickname=" + nickname + ", studentid="
				+ studentid + ", password=" + password + ", createtime=" + createtime + ", safequestion=" + safequestion
				+ ", safeanswer=" + safeanswer + ", headurl=" + headurl + ", contact=" + contact + ", sex=" + sex + "]";
	}

	public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getSafequestion() {
        return safequestion;
    }

    public void setSafequestion(String safequestion) {
        this.safequestion = safequestion == null ? null : safequestion.trim();
    }

    public String getSafeanswer() {
        return safeanswer;
    }

    public void setSafeanswer(String safeanswer) {
        this.safeanswer = safeanswer == null ? null : safeanswer.trim();
    }

    public String getHeadurl() {
        return headurl;
    }

    public void setHeadurl(String headurl) {
        this.headurl = headurl == null ? null : headurl.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }
}