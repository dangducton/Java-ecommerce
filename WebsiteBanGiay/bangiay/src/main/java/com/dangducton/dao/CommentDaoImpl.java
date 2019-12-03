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

import com.dangducton.entity.Comment;
import com.dangducton.entity.Sanpham;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<Comment> findAllComment(Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment");
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 12);
		return query.list();
	}
	
	@Transactional
	public List<Comment> countFindAllComment() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment");
		return query.list();
	}
	
	@Transactional
	public Comment getCommentById(Integer idcomment) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where idcomment = : idcomment");
		query.setParameter("idcomment", idcomment);
		Comment s = (Comment) query.uniqueResult();
		return s;
	}
	
	@Transactional
	public boolean deleteComment(Integer idComment) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Comment where idcomment = :idComment");
        query.setParameter("idComment", idComment);
        int i = query.executeUpdate();
        if(i>0) {
            return true;
        }else {
        	return false;
        }
	}
	
	@Transactional
	public List<Comment> getAllCommentById(int idsanpham) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where idsanpham.idsanpham = : idsanpham and status = 1 order by ngaycomment ");
		query.setParameter("idsanpham", idsanpham);
		return query.list();
	}	
	
	@Transactional
	public List<Comment> getCommentDetailSanPham(int idsanpham,Integer offset, Integer maxResults) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where idsanpham.idsanpham = : idsanpham and status = 1 order by ngaycomment");
		query.setParameter("idsanpham", idsanpham);
		query.setFirstResult(offset != null ? offset : 0);
		query.setMaxResults(maxResults != null ? maxResults : 5);
		
		return query.list();
	}
	
	@Transactional
	public void AddComment(Comment comment) {
		sessionFactory.getCurrentSession().save(comment);
		
	}

	@Transactional
	public void upDateComment(Comment comment) {
		sessionFactory.getCurrentSession().update(comment);;
		
	}
}
