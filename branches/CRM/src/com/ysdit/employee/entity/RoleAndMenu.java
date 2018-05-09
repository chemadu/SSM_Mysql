package com.ysdit.employee.entity;

public class RoleAndMenu {
	private String Id;
	private String RoleId;
	private Integer ModuleId;
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getRoleId() {
		return RoleId;
	}
	public void setRoleId(String roleId) {
		RoleId = roleId;
	}
	public Integer getModuleId() {
		return ModuleId;
	}
	public void setModuleId(Integer moduleId) {
		ModuleId = moduleId;
	}
	@Override
	public String toString() {
		return "RoleAndMenu [Id=" + Id + ", RoleId=" + RoleId + ", ModuleId="
				+ ModuleId + "]";
	}

	
	
}
