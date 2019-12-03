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

import com.dangducton.entity.Mausanpham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDaoImpl implements MauSanPhamDao {

	@Autowired
	SessionFactory sessionFactory;	
	
	@Transactional
	public List<Mausanpham> getAllMauSanPhams() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Mausanpham");
		return query.list();
	}
	
}
	

