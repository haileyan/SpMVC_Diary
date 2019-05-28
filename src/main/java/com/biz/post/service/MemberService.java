package com.biz.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.post.mapper.MemberDao;
import com.biz.post.model.MemberVO;

@Service
public class MemberService {

	@Autowired
	MemberDao mDao;
	
	public MemberVO findById(String b_userid) {
		return mDao.findById(b_userid);
	}

	public int insert(MemberVO memberVO) {
		int ret = mDao.insert(memberVO);
		return ret;
	}

}
