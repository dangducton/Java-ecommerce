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
import com.dangducton.entity.Comment;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChitiethoadonDaoImpl implements ChitiethoadonDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void AddChiTietHoaDon(Chitiethoadon chitiethoadon) {
		sessionFactory.getCurrentSession().saveOrUpdate(chitiethoadon);		
	}
	
	@Transactional
	public void UpdateChiTietHoaDon(Chitiethoadon chitiethoadon) {
		sessionFactory.getCurrentSession().update(chitiethoadon);		
	}
	
	@Transactional
	public List<Chitiethoadon> getAllChiTietHoaDon() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Chitiethoadon");
		return query.list();
	}
	
	@Transactional
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(Integer idNguoidung) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Chitiethoadon where idnguoidung.iduser = : idNguoidung and idhoadon is null");
		query.setParameter("idNguoidung", idNguoidung);
		return query.list();
	}
	
	@Transactional
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Chitiethoadon where idnguoidung.iduser = : idNguoidung and idhoadon.status = 1");
		query.setParameter("idNguoidung", idNguoidung);
		return query.list();
	
	}
	
	@Transactional
	public List<Chitiethoadon> TongThuNhap() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Chitiethoadon where idhoadon.status = 1");
		return query.list();
	}
	
	@Transactional
	public void update(Chitiethoadon chitiethoadon) {
		sessionFactory.getCurrentSession().update(chitiethoadon);
	}
	
	@Transactional
	public Chitiethoadon getChiTietHoaDonById(Integer chiTietId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Chitiethoadon where idchitiethoadon = :idchitiethoadon");
		query.setParameter("idchitiethoadon", chiTietId);
		Chitiethoadon s = (Chitiethoadon) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public Chitiethoadon getChiTietHoaDonByIdHoaDon(Integer idHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Chitiethoadon where idhoadon.idhoadon = :idHoaDon");
		query.setParameter("idHoaDon", idHoaDon);
		Chitiethoadon s = (Chitiethoadon) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public List<Chitiethoadon> getAllChiTietHoaDonTheoId(Integer idHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Chitiethoadon where idhoadon.idhoadon = :idHoaDon");
		query.setParameter("idHoaDon", idHoaDon);
		return query.list();
	}
	
	@Transactional
	public boolean deleteChiTietHoaDon(Integer chitiethoadon) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Chitiethoadon where idchitiethoadon = :idchitiethoadon");
        query.setParameter("idchitiethoadon", chitiethoadon);
        int i = query.executeUpdate();
        if(i>0) {
            return true;
        }else {
        	return false;
        }
	}
	
	@Transactional
	public long getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(int idNguoidung) {
	    Session session = sessionFactory.getCurrentSession();
		String countQ = "Select count(c.idchitiethoadon) from Chitiethoadon c where c.idnguoidung.iduser = : idNguoidung and c.idhoadon is null";
		Query countQuery = session.createQuery(countQ);
		countQuery.setParameter("idNguoidung", idNguoidung);
		return (Long) countQuery.uniqueResult();
	}
	
	@Transactional
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung,Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Chitiethoadon where idnguoidung.iduser = : idNguoidung and idhoadon.status = 1");
		query.setParameter("idNguoidung", idNguoidung);
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 5);
		
		return query.list();
	}
}

