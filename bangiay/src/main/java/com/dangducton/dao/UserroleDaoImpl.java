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

import com.dangducton.entity.Userrole;



@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserroleDaoImpl implements UserroleDao{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public Userrole getUserById(Integer idUser) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Userrole where idnguoidung.iduser = :iduser");
			query.setParameter("iduser", idUser);
			Userrole u = (Userrole) query.uniqueResult();
			return u;
		}
	
	@Transactional
	public List<Userrole> findAllUser(Integer offset, Integer maxResults) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Userrole");
			query.setFirstResult(offset != null ? offset : 0);
			query.setMaxResults(maxResults != null ? maxResults : 12);
			return query.list();
		}
	
	@Transactional
	public List<Userrole> findAllUser() {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Userrole");
			return query.list();
		}
	
	
	@Transactional
	public void UserRole(Userrole Userrole) {
		sessionFactory.getCurrentSession().save(Userrole);
	}
	
	@Transactional
	public void updateUserRole(Userrole Userrole) {
		sessionFactory.getCurrentSession().update(Userrole);;
	}
}

