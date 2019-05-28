package com.biz.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.post.mapper.PostDao;
import com.biz.post.model.PostVO;

@Service
public class PostService {

	@Autowired
	PostDao pDao;
	
	public List<PostVO> selectAll() {
		return pDao.selectAll();
	}

	public int insert(PostVO postVO) {
		int ret = pDao.insert(postVO);
		return ret;
	}

	public int update(PostVO postVO) {
		int ret = pDao.update(postVO);
		return ret;
	}

	public int delete(long id) {
		int ret = pDao.delete(id);
		return ret;
	}

	public PostVO findById(long id) {
		return pDao.findById(id);
	}

	
}
