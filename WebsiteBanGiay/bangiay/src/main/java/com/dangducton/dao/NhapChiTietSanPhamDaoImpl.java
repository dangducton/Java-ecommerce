package com.dangducton.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dangducton.entity.Nhapchitietsanpham;
import com.dangducton.entity.Sanpham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)

public class NhapChiTietSanPhamDaoImpl implements NhapChiTietSanPhamDao{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void addNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham) {
			sessionFactory.getCurrentSession().save(nhapchitietsanpham);
		}
	
	@Transactional
	public void upDateNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham) {
			sessionFactory.getCurrentSession().update(nhapchitietsanpham);
		}
	
	@Transactional
	public List<Nhapchitietsanpham> getAllSizeById(int maSanPham) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Nhapchitietsanpham where idsanpham.idsanpham = :idsanpham");
			query.setParameter("idsanpham", maSanPham);
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham() {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Nhapchitietsanpham");
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham(Integer offset, Integer maxResults) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Nhapchitietsanpham");
			query.setFirstResult(offset != null ? offset : 0);
			query.setMaxResults(maxResults != null ? maxResults : 12);
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> kiemTraTonKho(Integer offset, Integer maxResults) {
			Session session = sessionFactory.getCurrentSession();
			String sql = "SELECT DISTINCT sanpham.idsanpham,sanpham.tensanpham,sanpham.image1,mausanpham.tenmau,sizesanpham.tensize, truyvancon1.tong_sl1,truyvancon2.tong_sl2,((truyvancon1.tong_sl1) - (truyvancon2.tong_sl2)) as tonkho \r\n" + 
					"FROM nhapchitietsanpham,sanpham,sizesanpham,mausanpham,chitiethoadon,hoadon,\r\n" + 
					"     (SELECT idsanpham,idsize,sum(nhapchitietsanpham.soluong) as tong_sl1 \r\n" + 
					"     FROM nhapchitietsanpham \r\n" + 
					"     GROUP BY idsanpham,idsize) truyvancon1,\r\n" + 
					"	 (SELECT idsanpham,idsizesanpham,sum(chitiethoadon.soluong) as tong_sl2 \r\n" + 
					"     FROM chitiethoadon \r\n" + 
					"     GROUP BY idsanpham,idsizesanpham) truyvancon2 \r\n" + 
					"\r\n" + 
					"WHERE truyvancon1.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and sizesanpham.idsizesanpham =  nhapchitietsanpham.idsize \r\n" + 
					"and sizesanpham.idsizesanpham =  truyvancon1.idsize \r\n" + 
					"and sizesanpham.idsizesanpham =  truyvancon2.idsizesanpham \r\n" + 
					"and sizesanpham.idsizesanpham =  chitiethoadon.idsizesanpham \r\n" + 
					"and truyvancon1.idsize =  nhapchitietsanpham.idsize \r\n" + 
					"and truyvancon2.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and truyvancon2.idsizesanpham =  nhapchitietsanpham.idsize \r\n" + 
					"and truyvancon1.idsanpham = truyvancon2.idsanpham \r\n" + 
					"and truyvancon1.idsize = truyvancon2.idsizesanpham \r\n" + 
					"and sanpham.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and truyvancon2.idsanpham = sanpham.idsanpham \r\n" + 
					"and truyvancon1.idsanpham = sanpham.idsanpham \r\n" + 
					"and sanpham.idmausanpham = mausanpham.idmausanpham \r\n" + 
					"and chitiethoadon.idhoadon = hoadon.idhoadon \r\n" + 
					"and hoadon.status = 1 \r\n" + 
					"";
			SQLQuery query = session.createSQLQuery(sql);
			
			query.setFirstResult(offset != null ? offset : 0);
			query.setMaxResults(maxResults != null ? maxResults : 12);
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> tongNhapChiTiet(Integer offset, Integer maxResults) {
			Session session = sessionFactory.getCurrentSession();
			String sql = "select danhmucsanpham.tendanhmuc,sanpham.tensanpham,sanpham.image1,sizesanpham.tensize,mausanpham.tenmau,sum(nhapchitietsanpham.soluong) \r\n" + 
					"from nhapchitietsanpham,sanpham,sizesanpham,mausanpham,danhmucsanpham\r\n" + 
					"where nhapchitietsanpham.idsanpham = sanpham.idsanpham and sizesanpham.idsizesanpham = nhapchitietsanpham.idsize and sanpham.idmausanpham = mausanpham.idmausanpham and danhmucsanpham.iddanhmuc = sanpham.iddanhmuc\r\n" + 
					"group by  nhapchitietsanpham.idsanpham,nhapchitietsanpham.idsize,sanpham.tensanpham,sanpham.image1,sizesanpham.tensize,mausanpham.tenmau, danhmucsanpham.tendanhmuc\r\n" + 
					"";
			SQLQuery query = session.createSQLQuery(sql);
			query.setFirstResult(offset != null ? offset : 0);
			query.setMaxResults(maxResults != null ? maxResults : 12);
			return query.list();
		}
	@Transactional
	public List<Nhapchitietsanpham> tongNhapChiTiet() {
			Session session = sessionFactory.getCurrentSession();
			String sql = "select danhmucsanpham.tendanhmuc,sanpham.tensanpham,sanpham.image1,sizesanpham.tensize,mausanpham.tenmau,sum(nhapchitietsanpham.soluong) \r\n" + 
					"from nhapchitietsanpham,sanpham,sizesanpham,mausanpham,danhmucsanpham\r\n" + 
					"where nhapchitietsanpham.idsanpham = sanpham.idsanpham and sizesanpham.idsizesanpham = nhapchitietsanpham.idsize and sanpham.idmausanpham = mausanpham.idmausanpham and danhmucsanpham.iddanhmuc = sanpham.iddanhmuc\r\n" + 
					"group by  nhapchitietsanpham.idsanpham,nhapchitietsanpham.idsize,sanpham.tensanpham,sanpham.image1,sizesanpham.tensize,mausanpham.tenmau, danhmucsanpham.tendanhmuc\r\n" + 
					"";
			SQLQuery query = session.createSQLQuery(sql);
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> kiemTraTonKho() {
			Session session = sessionFactory.getCurrentSession();
			String sql = "SELECT DISTINCT sanpham.idsanpham,sanpham.tensanpham,sanpham.image1,mausanpham.tenmau,sizesanpham.tensize, truyvancon1.tong_sl1,truyvancon2.tong_sl2,((truyvancon1.tong_sl1) - (truyvancon2.tong_sl2)) as tonkho \r\n" + 
					"FROM nhapchitietsanpham,sanpham,sizesanpham,mausanpham,chitiethoadon,hoadon,\r\n" + 
					"     (SELECT idsanpham,idsize,sum(nhapchitietsanpham.soluong) as tong_sl1 \r\n" + 
					"     FROM nhapchitietsanpham\r\n" + 
					"     GROUP BY idsanpham,idsize) truyvancon1,\r\n" + 
					"	 (SELECT idsanpham,idsizesanpham,sum(chitiethoadon.soluong) as tong_sl2 \r\n" + 
					"     FROM chitiethoadon\r\n" + 
					"     GROUP BY idsanpham,idsizesanpham) truyvancon2 \r\n" + 
					"\r\n" + 
					"WHERE truyvancon1.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and sizesanpham.idsizesanpham =  nhapchitietsanpham.idsize \r\n" + 
					"and sizesanpham.idsizesanpham =  truyvancon1.idsize \r\n" + 
					"and sizesanpham.idsizesanpham =  truyvancon2.idsizesanpham \r\n" + 
					"and sizesanpham.idsizesanpham =  chitiethoadon.idsizesanpham \r\n" + 
					"and truyvancon1.idsize =  nhapchitietsanpham.idsize \r\n" + 
					"and truyvancon2.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and truyvancon2.idsizesanpham =  nhapchitietsanpham.idsize \r\n" + 
					"and truyvancon1.idsanpham = truyvancon2.idsanpham \r\n" + 
					"and truyvancon1.idsize = truyvancon2.idsizesanpham \r\n" + 
					"and sanpham.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"and truyvancon2.idsanpham = sanpham.idsanpham \r\n" + 
					"and truyvancon1.idsanpham = sanpham.idsanpham \r\n" + 
					"and sanpham.idmausanpham = mausanpham.idmausanpham \r\n" + 
					"and chitiethoadon.idhoadon = hoadon.idhoadon \r\n" + 
					"and hoadon.status = 1 \r\n" + 
					"";
			SQLQuery query = session.createSQLQuery(sql);
			return query.list();
		}
	
	@Transactional
	public List<Nhapchitietsanpham> SanPhamSapHetLimit10() {
			Session session = sessionFactory.getCurrentSession();
			String sql = "SELECT DISTINCT sanpham.idsanpham,sanpham.tensanpham,sanpham.image1,mausanpham.tenmau,sizesanpham.tensize, truyvancon1.tong_sl1,truyvancon2.tong_sl2,((truyvancon1.tong_sl1) - (truyvancon2.tong_sl2)) as tonkho \r\n" + 
					"					FROM nhapchitietsanpham,sanpham,sizesanpham,mausanpham,chitiethoadon,hoadon, \r\n" + 
					"					     (SELECT idsanpham,idsize,sum(nhapchitietsanpham.soluong) as tong_sl1 \r\n" + 
					"					     FROM nhapchitietsanpham \r\n" + 
					"					     GROUP BY idsanpham,idsize) truyvancon1, \r\n" + 
					"						 (SELECT idsanpham,idsizesanpham,sum(chitiethoadon.soluong) as tong_sl2 \r\n" + 
					"					     FROM chitiethoadon \r\n" + 
					"					     GROUP BY idsanpham,idsizesanpham) truyvancon2 \r\n" + 
					"\r\n" + 
					"					WHERE truyvancon1.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"					and sizesanpham.idsizesanpham =  nhapchitietsanpham.idsize \r\n" + 
					"					and sizesanpham.idsizesanpham =  truyvancon1.idsize \r\n" + 
					"					and sizesanpham.idsizesanpham =  truyvancon2.idsizesanpham \r\n" + 
					"					and sizesanpham.idsizesanpham =  chitiethoadon.idsizesanpham \r\n" + 
					"					and truyvancon1.idsize =  nhapchitietsanpham.idsize \r\n" + 
					"					and truyvancon2.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"					and truyvancon2.idsizesanpham =  nhapchitietsanpham.idsize  \r\n" + 
					"					and truyvancon1.idsanpham = truyvancon2.idsanpham \r\n" + 
					"					and truyvancon1.idsize = truyvancon2.idsizesanpham \r\n" + 
					"					and sanpham.idsanpham = nhapchitietsanpham.idsanpham \r\n" + 
					"					and truyvancon2.idsanpham = sanpham.idsanpham \r\n" + 
					"					and truyvancon1.idsanpham = sanpham.idsanpham \r\n" + 
					"					and sanpham.idmausanpham = mausanpham.idmausanpham \r\n" + 
					"					and chitiethoadon.idhoadon = hoadon.idhoadon \r\n" + 
					"					and hoadon.status = 1 \r\n" + 
					"					and ((truyvancon1.tong_sl1) - (truyvancon2.tong_sl2)) <= 10";
			SQLQuery query = session.createSQLQuery(sql);
			return query.list();
		}
	
	
	@Transactional
	public Nhapchitietsanpham getNhapChiTietSanPhamById(Integer idNhapChiTiet) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Nhapchitietsanpham where idnhapchitiet = : idNhapChiTiet");
			query.setParameter("idNhapChiTiet", idNhapChiTiet);
			Nhapchitietsanpham n = (Nhapchitietsanpham) query.uniqueResult();
			return n;
		}
	
	
	@Transactional
	public List<Nhapchitietsanpham> getAllNhapChiTietTheoSanPham(int maSanPham) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select idsize.tensize ,sum(soluong) from Nhapchitietsanpham where idsanpham.idsanpham = : idsanpham group by idsize.tensize");
		query.setParameter("idsanpham", maSanPham);
		return query.list();
	}
	}
	

