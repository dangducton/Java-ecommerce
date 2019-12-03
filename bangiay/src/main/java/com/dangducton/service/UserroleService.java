package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Userrole;

public interface UserroleService {
	public Userrole getUserById(Integer idUser);
	
	public void UserRole(Userrole Userrole);
	
	public List<Userrole> findAllUser();
	
	public List<Userrole> findAllUser(Integer offset, Integer maxResults);
	
	public void updateUserRole(Userrole Userrole);
}
