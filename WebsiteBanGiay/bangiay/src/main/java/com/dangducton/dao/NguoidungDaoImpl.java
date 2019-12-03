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

import com.dangducton.entity.Nguoidung;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NguoidungDaoImpl implements NguoidungDao {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Transactional
	public void AddNguoiDung(Nguoidung nguoiDung) {
		sessionFactory.getCurrentSession().save(nguoiDung);		
	}
	
	@Transactional
	public void UpdateNguoiDung(Nguoidung nguoiDung) {
		sessionFactory.getCurrentSession().update(nguoiDung);	
	}
	
	
	@Transactional
	public Nguoidung getNguoidungLogin(String tendangnhap, String matkhau) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nguoidung where tendangnhap = : tendangnhap and matkhau = : matkhau and status = 1");
		query.setParameter("tendangnhap",tendangnhap);
		query.setParameter("matkhau",matkhau);
		Nguoidung s = (Nguoidung) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public Nguoidung getNguoiDungById(Integer iduser) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nguoidung where iduser = :iduser");
		query.setParameter("iduser", iduser);
		Nguoidung n = (Nguoidung) query.uniqueResult();
		return n;
	}
	
	@Transactional
	public List<Nguoidung> getNguoiDungByTenDangNhap(String tendangnhap) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nguoidung where tendangnhap = :tendangnhap");
		query.setParameter("tendangnhap", tendangnhap);
		
		return query.list();
	}
	
	@Transactional
	public List<Nguoidung> getNguoiDungBySoDienThoai(String dienthoai) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nguoidung where dienthoai = :dienthoai");
		query.setParameter("dienthoai", dienthoai);
		
		return query.list();
	}
	
	@Transactional
	public List<Nguoidung> getNguoiDungByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nguoidung where email = :email");
		query.setParameter("email", email);
		
		return query.list();
	}
	
	@Transactional
	public List<Nguoidung> listNguoiDung() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Nguoidung");
		return query.list();
	}
}
