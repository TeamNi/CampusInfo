package com.njl.bean;

public class UsedPic {
    private Integer upicid;

    private Integer usedid;

    private String pictureurl;

    public Integer getUpicid() {
        return upicid;
    }

    public void setUpicid(Integer upicid) {
        this.upicid = upicid;
    }

    public Integer getUsedid() {
        return usedid;
    }

    public void setUsedid(Integer usedid) {
        this.usedid = usedid;
    }

    public String getPictureurl() {
        return pictureurl;
    }

    public void setPictureurl(String pictureurl) {
        this.pictureurl = pictureurl == null ? null : pictureurl.trim();
    }

	@Override
	public String toString() {
		return "UsedPic [upicid=" + upicid + ", usedid=" + usedid + ", pictureurl=" + pictureurl + "]";
	}

	public UsedPic(Integer upicid, Integer usedid, String pictureurl) {
		super();
		this.upicid = upicid;
		this.usedid = usedid;
		this.pictureurl = pictureurl;
	}

	public UsedPic() {
		super();
	}
}