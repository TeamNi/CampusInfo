package com.njl.bean;

import java.util.Date;

public class Advertisement {
    private Integer adid;

    private Integer userid;

    private String title;

    private String content;

    private String pictureurl;

    private Integer conditionck;

    private Integer priority;

    private Date createtime;

    private Integer checkuser;
    
    private User user;

    public Advertisement() {
		super();
	}

	public Advertisement(Integer adid, Integer userid, String title, String content, String pictureurl,
			Integer conditionck, Integer priority, Date createtime, Integer checkuser) {
		super();
		this.adid = adid;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.pictureurl = pictureurl;
		this.conditionck = conditionck;
		this.priority = priority;
		this.createtime = createtime;
		this.checkuser = checkuser;
	}

	@Override
	public String toString() {
		return "Advertisement [adid=" + adid + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", pictureurl=" + pictureurl + ", conditionck=" + conditionck + ", priority=" + priority + ", createtime="
				+ createtime + ", checkuser=" + checkuser + ", user=" + user + "]";
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

    public Integer getConditionck() {
        return conditionck;
    }

    public void setConditionck(Integer conditionck) {
        this.conditionck = conditionck;
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

    public Integer getCheckuser() {
        return checkuser;
    }

    public void setCheckuser(Integer checkuser) {
        this.checkuser = checkuser;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}