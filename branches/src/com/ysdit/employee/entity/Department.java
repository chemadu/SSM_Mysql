package com.ysdit.employee.entity;

import java.io.Serializable;
import java.util.List;

public class Department implements Serializable {

	private String Id;
	private String Name;
	private Integer Int0;
	private String String0;
	
	
	private Integer page;
	private Integer rows;
	
	private List<Menu> menu;
	
	public List<Menu> getMenu() {
		return menu;
	}
	public void setMenu(List<Menu> menu) {
		this.menu = menu;
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
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Integer getInt0() {
		return Int0;
	}
	public void setInt0(Integer int0) {
		Int0 = int0;
	}
	public String getString0() {
		return String0;
	}
	public void setString0(String string0) {
		String0 = string0;
	}
	@Override
	public String toString() {
		return "Department [Id=" + Id + ", Name=" + Name + ", Int0=" + Int0
				+ ", String0=" + String0 + ", page=" + page + ", rows=" + rows
				+ ", menu=" + menu + "]";
	}

	
	
}
