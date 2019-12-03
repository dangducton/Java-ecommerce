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

import com.dangducton.entity.Chitiethoadon;
import com.dangducton.entity.Hoadon;
import com.dangducton.entity.Sanpham;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class HoaDonDaoImpl implements HoaDonDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void AddHoaDon(Hoadon Hoadon) {
		sessionFactory.getCurrentSession().save(Hoadon);		
	}
	
	@Transactional
	public void UpDateHoaDon(Hoadon Hoadon) {
		sessionFactory.getCurrentSession().update(Hoadon);
	}
	
	@Transactional
	public Hoadon getHoaDonByID(Integer idHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Hoadon where idhoadon = :idHoaDon");
		query.setParameter("idHoaDon", idHoaDon);
		Hoadon s = (Hoadon) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public List<Hoadon> findAllHoaDon(Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Hoadon");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Hoadon> findAllHoaDon() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Hoadon");
		return query.list();
	}
	@Transactional
	public List<Hoadon> findAllHoaDonChuaXacDinh() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Hoadon where status = 3");
		return query.list();
	}
	
	@Transactional
	public List<Hoadon> tongDonHang() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Hoadon where status = 1");
		return query.list();
	}
}
