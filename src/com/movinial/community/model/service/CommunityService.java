package com.movinial.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.movinial.common.JDBCTemplate.*;
import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.dao.CommunityDao;
import com.movinial.community.model.vo.Community;

public class CommunityService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn);
		// SELECT문의 결과는 ResultSet이 맞긴한데
		// 게시글의 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Community> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

}
