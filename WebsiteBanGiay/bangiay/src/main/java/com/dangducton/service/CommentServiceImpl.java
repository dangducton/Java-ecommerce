package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.CommentDaoImpl;
import com.dangducton.entity.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDaoImpl commentDaoImpl;
	
	public List<Comment> getAllCommentById(int idsanpham) {
		return commentDaoImpl.getAllCommentById(idsanpham);
	}
	
	public List<Comment> getCommentDetailSanPham(int idsanpham, Integer offset, Integer maxResults) {
		return commentDaoImpl.getCommentDetailSanPham(idsanpham, offset, maxResults);
	}
	
	public void AddComment(Comment comment) {
		commentDaoImpl.AddComment(comment);
	}

	public List<Comment> findAllComment(Integer offset, Integer maxResults) {
		return commentDaoImpl.findAllComment(offset, maxResults);
	}

	public void upDateComment(Comment comment) {
		commentDaoImpl.upDateComment(comment);
	}

	public List<Comment> countFindAllComment() {
		return commentDaoImpl.countFindAllComment();
	}

	public Comment getCommentById(Integer idcomment) {
		return commentDaoImpl.getCommentById(idcomment);
	}

	public boolean deleteComment(Integer idComment) {
		return commentDaoImpl.deleteComment(idComment);
	}

}
