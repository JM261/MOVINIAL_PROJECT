package com.movinial.curation.model.service;

import static com.movinial.common.JDBCTemplate.close;
import static com.movinial.common.JDBCTemplate.commit;
import static com.movinial.common.JDBCTemplate.getConnection;
import static com.movinial.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<CurationList> randomList() { // randomList :  큐레이션 랜덤으로 뽑아오기

		Connection conn = getConnection();
		
		ArrayList<CurationList> list = new CurationDao().randomList(conn);
		
		close(conn);
		
		return list;
		
	} // randomList :  큐레이션 랜덤으로 뽑아오기

	public ArrayList<Movie> latestList() { // latestList : 가장 최신 영화 조회하기

		Connection conn = getConnection();
		
		ArrayList<Movie> list = new CurationDao().latestList(conn);
		
		close(conn);
		
		return list;
		
	} // latestList : 가장 최신 영화 조회하기

	

	
	
}
