package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.UserroleDaoImpl;
import com.dangducton.entity.Userrole;

@Service
public class UserroleServiceImpl implements UserroleService{
	
	@Autowired
	UserroleDaoImpl userRoleDaoImpl;
	
	public Userrole getUserById(Integer idUser) {
		return userRoleDaoImpl.getUserById(idUser);
	}

	public void UserRole(Userrole Userrole) {
		userRoleDaoImpl.UserRole(Userrole);
	}

	public List<Userrole> findAllUser() {
		return userRoleDaoImpl.findAllUser();
	}

	public List<Userrole> findAllUser(Integer offset, Integer maxResults) {
		return userRoleDaoImpl.findAllUser(offset, maxResults);
	}

	public void updateUserRole(Userrole Userrole) {
		userRoleDaoImpl.updateUserRole(Userrole);
		
	}

}
