package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Role;


public interface RoleDao {

	public Role getRoleById(Integer idRole);
	
	public List<Role> findAllRoleById();
}
			
