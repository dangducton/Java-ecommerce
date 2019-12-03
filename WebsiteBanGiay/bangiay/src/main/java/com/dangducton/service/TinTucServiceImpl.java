	package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.TinTucDaoImpl;
import com.dangducton.entity.Tintuc;

@Service
public class TinTucServiceImpl implements TinTucService{
	@Autowired
	TinTucDaoImpl tinTucDaoImpl;
	public void AddTinTuc(Tintuc tintuc) {
		tinTucDaoImpl.AddTinTuc(tintuc);
		
	}
	public List<Tintuc> findTinTuc(Integer offset, Integer maxResults) {
		return tinTucDaoImpl.findTinTuc(offset, maxResults);
	}
	
	public List<Tintuc> findTinTuc() {
		return tinTucDaoImpl.findTinTuc();
	}
	
	public Tintuc getTinTucById(Integer idTinTuc) {
		return tinTucDaoImpl.getTinTucById(idTinTuc);
	}
	public void UpdateTinTuc(Tintuc tintuc) {
		tinTucDaoImpl.UpdateTinTuc(tintuc);
		
	}
	public List<Tintuc> findTinTucFrontEnd(Integer offset, Integer maxResults) {
		return tinTucDaoImpl.findTinTucFrontEnd(offset, maxResults);
	}
	public List<Tintuc> findTinTucFrontEnd() {
		return tinTucDaoImpl.findTinTucFrontEnd();
	}

}
