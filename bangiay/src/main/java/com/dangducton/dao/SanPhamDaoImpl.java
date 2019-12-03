package com.dangducton.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dangducton.entity.Sanpham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SanPhamDaoImpl implements SanPhamDao {
	
	
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void addProduct(Sanpham sanpham) {
		sessionFactory.getCurrentSession().save(sanpham);
	}
	
	@Transactional
	public List<Sanpham> getProductDetail(int maDanhMuc) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = : iddanhmuc and status = 1 order by ngaynhap desc");
		query.setParameter("iddanhmuc", maDanhMuc);
		query.setMaxResults(6);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> getProductDetailTheoDanhMuc(int maDanhMuc) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = : iddanhmuc and status = 1 order by ngaynhap desc");
		query.setParameter("iddanhmuc", maDanhMuc);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> getProductDetailMauSac(int maMau) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where idmausanpham.idmausanpham = : idmausanpham and status = 1 order by ngaynhap desc");
		query.setParameter("idmausanpham", maMau);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> findAll(Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Sanpham where status = 1 ");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> findAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Sanpham where status = 1 ");
		
		return query.list();
	}
	@Transactional
	public long getTotal() {
	    Session session = sessionFactory.getCurrentSession();
		String countQ = "Select count (c.idsanpham) from Sanpham c where c.status = 1";
		Query countQuery = session.createQuery(countQ);
		return (Long) countQuery.uniqueResult();
	}
	
	@Transactional
	public long getTotalTheoDanhMuc(int maDanhMuc) {
	    Session session = sessionFactory.getCurrentSession();
	    Query query = session.createQuery("from Sanpham where iddanhmuc = :iddanhmuc and status = 1");
	    query.setParameter("iddanhmuc", maDanhMuc);
		return (Long) query.uniqueResult();
	}
	
	@Transactional
	public Sanpham getProductById(Integer proId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where idsanpham = :proId and status = 1");
		query.setParameter("proId", proId);
		Sanpham s = (Sanpham) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public List<Sanpham> getProductDetailSanPham(int maDanhMuc) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = : iddanhmuc and status = 1 order by ngaynhap desc");
		query.setParameter("iddanhmuc", maDanhMuc);
		query.setMaxResults(8);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> getProductDetailSanPhamTheoDanhMuc(int maDanhMuc,Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = : iddanhmuc and status = 1 order by ngaynhap desc");
		query.setParameter("iddanhmuc", maDanhMuc);
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> getProductDetailSanPhamTheoMauSac(int maMau,Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where idmausanpham.idmausanpham = : idmausanpham and status = 1 order by ngaynhap desc");
		query.setParameter("idmausanpham", maMau);
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Sanpham> sanPhamMoiNhat() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Sanpham where status = 1 order by ngaynhap desc");
		query.setMaxResults(6);
		return query.list();
	}
	
	
	//@Transactional
	//public List<Sanpham> timKiemTatCa(String tensp, int maDM, int maMau, Integer offset, Integer maxResults) {
	//	Session session = sessionFactory.getCurrentSession();
	//	Query query;
	//	if(maDM != 0) {
	//		query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = :maDM and tensanpham like :tensp");
	//		query.setParameter("maDM", maDM);
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}if(maMau != 0) {
	//		query = session.createQuery("from Sanpham where idmausanpham.idmausanpham = :maMau and tensanpham like :tensp");
	//		query.setParameter("maMau", maMau);
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}
	//	else {
	//		query = session.createQuery("from Sanpham where tensanpham like :tensp");
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}
	//	query.setFirstResult(offset != null ? offset : 0);
	//	query.setMaxResults(maxResults != null ? maxResults : 12);
	//	List list = query.list();
	//	return list;
	//
	//
	//}
	
	//@Transactional
	//public List<Sanpham> timKiemTatCa(String tensp, int maDM, int maMau) {
	//	Session session = sessionFactory.getCurrentSession();
	//	Query query;
	//	if(maDM != 0) {
	//		query = session.createQuery("from Sanpham where iddanhmuc.iddanhmuc = :maDM and tensanpham like :tensp");
	//		query.setParameter("maDM", maDM);
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}if(maMau != 0) {
	//		query = session.createQuery("from Sanpham where idmausanpham.idmausanpham = :maMau and tensanpham like :tensp");
	//		query.setParameter("maMau", maMau);
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}
	//	else {
	//		query = session.createQuery("from Sanpham where tensanpham like :tensp");
	//		query.setParameter("tensp", "%"+tensp+"%");
	//	}
	//	List list = query.list();
	//	return list;
	//
	//}
	
	@Transactional
	public List<Sanpham> timKiemTatCaTheoTen(String tensp, Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where tensanpham like :tensp and status = 1");
		query.setParameter("tensp", "%"+tensp+"%");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		List list = query.list();
		
		return list;
		
	}
	
	@Transactional
	public List<Sanpham> timKiemTatCaTheoTen(String tensp) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where tensanpham like :tensp and status = 1");
		query.setParameter("tensp", "%"+tensp+"%");
		List list = query.list();
		
		return list;
	}
	

	
	@Transactional
	public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc, Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where giakhuyenmai BETWEEN :giaBatDau and :giaKetThuc and status = 1");
		query.setParameter("giaBatDau", giaBatDau);
		query.setParameter("giaKetThuc", giaKetThuc);
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		List list = query.list();
		
		return list;
	}
	
	@Transactional
	public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Sanpham where giakhuyenmai BETWEEN :giaBatDau and :giaKetThuc and status = 1");
		query.setParameter("giaBatDau", giaBatDau);
		query.setParameter("giaKetThuc", giaKetThuc);
		List list = query.list();
		
		return list;
	}
	
	@Transactional
	public void updateProduct(Sanpham sanpham) {
		sessionFactory.getCurrentSession().update(sanpham);
	}
		
}
