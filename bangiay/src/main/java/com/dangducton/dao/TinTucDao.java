package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Tintuc;

public interface TinTucDao {
	public void AddTinTuc(Tintuc tintuc);
	
	public List<Tintuc> findTinTuc(Integer offset, Integer maxResults);
	
	public List<Tintuc> findTinTuc();
	
	public Tintuc getTinTucById(Integer idTinTuc);
	
	public void UpdateTinTuc(Tintuc tintuc);
	
	public List<Tintuc> findTinTucFrontEnd(Integer offset, Integer maxResults);
	
	public List<Tintuc> findTinTucFrontEnd();
}
