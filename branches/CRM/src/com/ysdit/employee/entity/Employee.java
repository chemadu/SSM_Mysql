package com.ysdit.employee.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Employee {

	private String Id;
	private String LoginName;
	private String Password;
	private String IsLockout;
	private String LastLoginTime;
	private Integer PsdWrongTime;
	private String LockTime;
	private String ProtectEMail;
	private String protectMTel;
	private Timestamp CreateTime;

	private Integer page;
	private Integer rows;

	
	
	private List<Department>  department;
	
	
	public List<Department> getDepartment() {
		return department;
	}

	public void setDepartment(List<Department> department) {
		this.department = department;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getLoginName() {
		return LoginName;
	}

	public void setLoginName(String loginName) {
		LoginName = loginName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getIsLockout() {
		return IsLockout;
	}

	public void setIsLockout(String isLockout) {
		IsLockout = isLockout;
	}

	public String getLastLoginTime() {
		return LastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		LastLoginTime = lastLoginTime;
	}

	public Integer getPsdWrongTime() {
		return PsdWrongTime;
	}

	public void setPsdWrongTime(Integer psdWrongTime) {
		PsdWrongTime = psdWrongTime;
	}

	public String getLockTime() {
		return LockTime;
	}

	public void setLockTime(String lockTime) {
		LockTime = lockTime;
	}

	public String getProtectEMail() {
		return ProtectEMail;
	}

	public void setProtectEMail(String protectEMail) {
		ProtectEMail = protectEMail;
	}

	public String getProtectMTel() {
		return protectMTel;
	}

	public void setProtectMTel(String protectMTel) {
		this.protectMTel = protectMTel;
	}

	public Timestamp getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(Timestamp createTime) {
		CreateTime = createTime;
	}

	@Override
	public String toString() {
		return "Employee [Id=" + Id + ", LoginName=" + LoginName
				+ ", Password=" + Password + ", IsLockout=" + IsLockout
				+ ", LastLoginTime=" + LastLoginTime + ", PsdWrongTime="
				+ PsdWrongTime + ", LockTime=" + LockTime + ", ProtectEMail="
				+ ProtectEMail + ", protectMTel=" + protectMTel
				+ ", CreateTime=" + CreateTime + ", page=" + page + ", rows="
				+ rows + ", department=" + department + "]";
	}



	

}
