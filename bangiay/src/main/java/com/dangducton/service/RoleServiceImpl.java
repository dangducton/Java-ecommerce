package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.RoleDaoImpl;
import com.dangducton.entity.Role;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleDaoImpl roleDaoImpl;

	public Role getRoleById(Integer idRole) {
		
		return roleDaoImpl.getRoleById(idRole);
		
		
	}

	public List<Role> findAllRoleById() {
		return roleDaoImpl.findAllRoleById();
	}
}
