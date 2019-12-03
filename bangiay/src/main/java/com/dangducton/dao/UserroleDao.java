package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Role;
import com.dangducton.entity.Userrole;

public interface UserroleDao {
	
	public void UserRole(Userrole Userrole);
	
	public Userrole getUserById(Integer idUser);
	
	public List<Userrole> findAllUser();
	
	public List<Userrole> findAllUser(Integer offset, Integer maxResults);
	
	public void updateUserRole(Userrole Userrole);
}
