package com.biz.post.mapper;

import org.apache.ibatis.jdbc.SQL;

public class MemberSQL {

	public String member_insert_sql(){
		SQL sql = new SQL()
			.INSERT_INTO("tbl_member")
			.INTO_COLUMNS("b_id").INTO_VALUES("SEQ_MEMBER.NEXTVAL")
			.INTO_COLUMNS("b_userid").INTO_VALUES("#{b_userid}")
			.INTO_COLUMNS("b_password").INTO_VALUES("#{b_password}")
			.INTO_COLUMNS("b_repassword").INTO_VALUES("#{b_repassword}")
			.INTO_COLUMNS("b_tel").INTO_VALUES("#{b_tel}")
			.INTO_COLUMNS("b_addr").INTO_VALUES("#{b_addr}");
		return sql.toString();
	}
	
	public String member_update_sql() {
		SQL sql = new SQL()
				.UPDATE("tbl_member")
				.SET("b_userid = #{b_userid}")
				.SET("b_password = #{b_password}")
				.SET("b_repassword = #{b_repassword}")
				.SET("b_tel = #{b_tel}")
				.SET("b_addr = #{b_addr}")
				.WHERE("id = #{id}");
		return sql.toString();
	}
	
}
