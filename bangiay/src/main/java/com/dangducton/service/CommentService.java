package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Comment;

public interface CommentService {
	List<Comment> getAllCommentById(int idsanpham);
	
	public List<Comment> getCommentDetailSanPham(int idsanpham,Integer offset, Integer maxResults);
	
	public void AddComment(Comment comment);
	
	public List<Comment> findAllComment(Integer offset, Integer maxResults);
	
	public void upDateComment(Comment comment);
	
	public List<Comment> countFindAllComment();
	
	public Comment getCommentById(Integer idcomment);
	
	public boolean deleteComment(Integer idComment);
}
