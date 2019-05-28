package com.biz.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.post.model.PostVO;

public interface PostDao {

	@Select(" SELECT * FROM tbl_post ")
	public List<PostVO> selectAll();

	@Select(" SELECT * FROM tbl_post WHERE id = #{id} ")
	public PostVO findById(long id);
	
	@InsertProvider(type=PostSQL.class, method="post_insert_sql")
	public int insert(PostVO postVO);
	
	@UpdateProvider(type=PostSQL.class, method="post_update_sql")
	public int update(PostVO postVO);

	@Delete(" DELETE FROM tbl_post WHERE id = #{id} ")
	public int delete(long id);
}
