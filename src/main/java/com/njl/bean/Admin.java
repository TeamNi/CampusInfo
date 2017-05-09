package com.njl.bean;

public class Admin {
    private Integer adminid;

    private String username;

    private String admin;

    private String password;

    public Admin() {
		super();
	}

	public Admin(Integer adminid, String username, String admin, String password) {
		super();
		this.adminid = adminid;
		this.username = username;
		this.admin = admin;
		this.password = password;
	}

	public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin == null ? null : admin.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}