package com.biz.post.mapper;

import org.apache.ibatis.jdbc.SQL;

public class PostSQL {

	public String post_insert_sql() {
		SQL sql = new SQL()
				.INSERT_INTO("tbl_post")
				.INTO_COLUMNS("id").INTO_VALUES("SEQ_POST.NEXTVAL")
				.INTO_COLUMNS("p_auth").INTO_VALUES("#{p_auth}")
				.INTO_COLUMNS("p_date").INTO_VALUES("#{p_date}")
				.INTO_COLUMNS("p_title").INTO_VALUES("#{p_title}")
				.INTO_COLUMNS("p_contents").INTO_VALUES("#{p_contents}");
		return sql.toString();
	}
	
	public String post_update_sql() {
		SQL sql = new SQL()
				.UPDATE("tbl_post")
				.SET("p_auth = #{p_auth}")
				.SET("p_date = #{p_date}")
				.SET("p_title = #{p_title}")
				.SET("p_contents = #{p_contents}")
				.WHERE("id = #{id}");
		return sql.toString();
	}
}
