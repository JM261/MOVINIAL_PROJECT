package com.movinial.notice.model.service;

import static com.movinial.common.JDBCTemplate.close;
import static com.movinial.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.notice.model.dao.NoticeDao;
import com.movinial.notice.model.vo.Category;

public class NoticeService {
	
	public ArrayList<Category> selectCategory(){
		
		Connection conn = getConnection();
		
		ArrayList<Category> list = new NoticeDao().selectCategory(conn);
		
		close(conn);
		
		return list;
	}

}
