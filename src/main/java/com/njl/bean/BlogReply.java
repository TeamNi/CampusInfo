package com.njl.bean;

import java.util.Date;

public class BlogReply {
    private Integer replyid;

    private Integer blogid;

    private Integer userid;

    private String content;

    private Date createtime;
    
    //联合查询，查询出用户nickname
    private User user;

    public BlogReply() {
		super();
	}

	public BlogReply(Integer replyid, Integer blogid, Integer userid, String content, Date createtime) {
		super();
		this.replyid = replyid;
		this.blogid = blogid;
		this.userid = userid;
		this.content = content;
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "BlogReply [replyid=" + replyid + ", blogid=" + blogid + ", userid=" + userid + ", content=" + content
				+ ", createtime=" + createtime + ", user=" + user + "]";
	}

	public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public Integer getBlogid() {
        return blogid;
    }

    public void setBlogid(Integer blogid) {
        this.blogid = blogid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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