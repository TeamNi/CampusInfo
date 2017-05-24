package com.njl.bean;

import java.util.Date;

public class Advertisement {
    private Integer adid;

    private Integer userid;

    private String title;

    private String content;

    private String pictureurl;

    private Integer condition;

    private Integer priority;

    private Date createtime;
    
    private User user;

	public Advertisement(Integer adid, Integer userid, String title, String content, String pictureurl,
			Integer condition, Integer priority, Date createtime) {
		super();
		this.adid = adid;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.pictureurl = pictureurl;
		this.condition = condition;
		this.priority = priority;
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "Advertisement [adid=" + adid + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", pictureurl=" + pictureurl + ", condition=" + condition + ", priority=" + priority + ", createtime="
				+ createtime + ", user=" + user + "]";
	}

	public Advertisement() {
		super();
	}

	public Integer getAdid() {
        return adid;
    }

    public void setAdid(Integer adid) {
        this.adid = adid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPictureurl() {
        return pictureurl;
    }

    public void setPictureurl(String pictureurl) {
        this.pictureurl = pictureurl == null ? null : pictureurl.trim();
    }

    public Integer getCondition() {
        return condition;
    }

    public void setCondition(Integer condition) {
        this.condition = condition;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}