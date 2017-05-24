package com.njl.bean;

import java.util.Date;

public class Notification {
    private Integer noid;

    private Integer userid;

    private String title;

    private String content;

    private Integer condition;

    private Integer priority;

    private Date createtime;
    
    private User user;

    public Notification(Integer noid, Integer userid, String title, String content, Integer condition, Integer priority,
			Date createtime) {
		super();
		this.noid = noid;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.condition = condition;
		this.priority = priority;
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "Notification [noid=" + noid + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", condition=" + condition + ", priority=" + priority + ", createtime=" + createtime + ", user="
				+ user + "]";
	}

	public Notification() {
		super();
	}

	public Integer getNoid() {
        return noid;
    }

    public void setNoid(Integer noid) {
        this.noid = noid;
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