package com.movinial.curation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.movinial.common.JDBCTemplate.*;
import com.movinial.curation.model.dao.CurationDao;
import com.movinial.curation.model.vo.CurationList;
import com.movinial.movie.model.vo.Movie;

public class CurationService {

	public ArrayList<Movie> searchMovie(String movieKeyword) { // searchMovie : 키워드로 영화 조회 

		Connection conn = getConnection();
		
		ArrayList<Movie> list = new CurationDao().searchMovie(conn, movieKeyword);
		
		close(conn);
		
		return list;
		
	} // searchMovie : 키워드로 영화 조회 

	public int insertCurationList(CurationList cl) { // insertCurationList : 큐레이션 저장
		
		Connection conn = getConnection();
		
		int result = new CurationDao().insertCurationList(conn, cl);
		
		close(conn);
		
		return result;
	} // insertCurationList : 큐레이션 저장

	public ArrayList<CurationList> selectCurationList() { // selectCurationList : 큐레이션 조회

		Connection conn = getConnection();
		
		ArrayList<CurationList> list = new CurationDao().selectCurationList(conn);
		
		close(conn);
		
		return list;
		
	} // selectCurationList : 큐레이션 조회

	

	public int deleteCuration(int listNo) {

		Connection conn = getConnection();
		
		int result = new CurationDao().deleteCuration(conn, listNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	

	
	
}
