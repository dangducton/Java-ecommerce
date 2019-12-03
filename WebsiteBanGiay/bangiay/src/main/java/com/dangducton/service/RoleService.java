package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Role;

public interface RoleService {
	public Role getRoleById(Integer idRole);
	
	public List<Role> findAllRoleById();
}
