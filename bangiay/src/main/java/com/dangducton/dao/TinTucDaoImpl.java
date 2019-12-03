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

import com.dangducton.entity.Hoadon;
import com.dangducton.entity.Tintuc;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TinTucDaoImpl implements TinTucDao{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void AddTinTuc(Tintuc tintuc) {
		sessionFactory.getCurrentSession().save(tintuc);
		
	}
	
	@Transactional
	public void UpdateTinTuc(Tintuc tintuc) {
		sessionFactory.getCurrentSession().update(tintuc);
		
	}
	
	@Transactional
	public List<Tintuc> findTinTuc(Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Tintuc");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	@Transactional
	public List<Tintuc> findTinTuc() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Tintuc");
		return query.list();
	}
	
	@Transactional
	public Tintuc getTinTucById(Integer idTinTuc) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Tintuc where idtintuc = : idtintuc");
		query.setParameter("idtintuc", idTinTuc);
		Tintuc t = (Tintuc) query.uniqueResult();
		return t;
	}
	@Transactional
	public List<Tintuc> findTinTucFrontEnd(Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Tintuc where status = 1 ORDER BY ngaytao DESC");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Tintuc> findTinTucFrontEnd() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Tintuc where status = 1 ORDER BY ngaytao DESC");
		return query.list();
	}
}
