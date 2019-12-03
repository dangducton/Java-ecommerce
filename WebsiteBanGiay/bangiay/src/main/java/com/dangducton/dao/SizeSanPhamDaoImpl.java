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

import com.dangducton.entity.Sizesanpham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeSanPhamDaoImpl implements SizeSanPhamDao {

	@Autowired
	SessionFactory sessionFactory;	
	
	@Transactional
	public List<Sizesanpham> getAllSizeSanPham() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Sizesanpham");
		return query.list();
	}
	
	@Transactional
	public Sizesanpham getIdByTenSize(String tensize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sizesanpham where tensize = : tensize");
		query.setParameter("tensize", tensize);
		Sizesanpham s = (Sizesanpham) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public Sizesanpham getIdByIdSize(Integer idsizesanpham) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sizesanpham where idsizesanpham = : idsizesanpham");
		query.setParameter("idsizesanpham", idsizesanpham);
		Sizesanpham s = (Sizesanpham) query.uniqueResult();
		return s;
	}

}
