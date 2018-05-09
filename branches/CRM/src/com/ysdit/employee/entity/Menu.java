package com.ysdit.employee.entity;

public class Menu {
	
	private Integer id;
	private String text;
	private Integer parentId;
	private String path;
	private Integer weight;
	private String checked;
	private Integer int0;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public String getchecked() {
		return checked;
	}
	public void setchecked(String checked) {
		this.checked = checked;
	}
	public Integer getInt0() {
		return int0;
	}
	public void setInt0(Integer int0) {
		this.int0 = int0;
	}
	@Override
	public String toString() {
		return "Menu [id=" + id + ", text=" + text + ", parentId=" + parentId
				+ ", path=" + path + ", weight=" + weight + ", checked=" + checked
				+ ", int0=" + int0 + "]";
	}
	
	
}
