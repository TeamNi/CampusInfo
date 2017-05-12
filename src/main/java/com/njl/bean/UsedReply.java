package com.njl.bean;

import java.util.Date;

public class UsedReply {
    private Integer replyid;

    private Integer usedid;

    private Integer userid;

    private String content;

    private Date createtime;
    
    //联合查询，查询出用户nickname
    private User user;

    public UsedReply() {
		super();
	}

	public UsedReply(Integer replyid, Integer usedid, Integer userid, String content, Date createtime) {
		super();
		this.replyid = replyid;
		this.usedid = usedid;
		this.userid = userid;
		this.content = content;
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "UsedReply [replyid=" + replyid + ", usedid=" + usedid + ", userid=" + userid + ", content=" + content
				+ ", createtime=" + createtime + ", user=" + user + "]";
	}

	public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public Integer getUsedid() {
        return usedid;
    }

    public void setUsedid(Integer usedid) {
        this.usedid = usedid;
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