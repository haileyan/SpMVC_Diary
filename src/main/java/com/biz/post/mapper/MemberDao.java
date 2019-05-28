package com.biz.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.post.model.MemberVO;

public interface MemberDao {

	@Select(" SELECT * FROM tbl_member ")
	public List<MemberVO> selectAll();
	
	@Select(" SELECT * FROM tbl_member WHERE b_userid = #{b_userid} ")
	public MemberVO findById(String b_userid);
	
	@InsertProvider(type=MemberSQL.class, method="member_insert_sql")
	public int insert(MemberVO memberVO);
	
	@UpdateProvider(type=MemberSQL.class, method="member_update_sql")
	public int update(MemberVO memberVO);
	
	@Delete(" DELETE * FROM tbl_member WHERE b_userid = #{b_userid} ")
	public int delete(String b_userid);

}
