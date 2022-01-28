package com.movinial.main.service;

import static com.movinial.common.JDBCTemplate.close;
import static com.movinial.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.community.model.vo.Community;
import com.movinial.main.dao.mainDao;

public class mainService {

	public ArrayList<Community> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new mainDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

}
