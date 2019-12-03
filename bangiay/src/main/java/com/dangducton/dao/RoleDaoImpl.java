package com.dangducton.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dangducton.entity.Role;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RoleDaoImpl {
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<Role> findAllRoleById() {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Role");
			return query.list();
		}
	
	@Transactional
	public Role getRoleById(Integer idRole) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Role where id = :idRole");
			query.setParameter("idRole", idRole);
			Role u = (Role) query.uniqueResult();
			return u;
		}
}