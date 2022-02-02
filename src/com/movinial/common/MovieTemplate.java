package com.movinial.common;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Properties;

import org.json.JSONException;
import org.json.JSONObject;

import com.movinial.movie.model.service.MovieService;

/**
 * Movie Template
 */
public class MovieTemplate {
    
	/**
	 * TMDB API KEY 가져오기
	 * @return API KEY
	 */
	public static String getApiKey() {
		
		Properties prop = new Properties();
		
		String fileName = MovieTemplate.class.getResource("/properties/tmdb/tmdb.properties").getPath();
		
		String apiKey = "";
		
		try {
			
			prop.load(new FileInputStream(fileName));
			
			apiKey = prop.getProperty("api_key");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return apiKey;
		
	}
    
	/**
	 * 영화 상세정보 가져오기
	 * @param movieId
	 * @return JSON Object
	 * @throws JSONException
	 * @throws IOException
	 */
	public static JSONObject getMovieDetail(int movieId) throws JSONException, IOException {
		
		String url = "https://api.themoviedb.org/3/movie/" + movieId + "?api_key=" + getApiKey() + "&language=ko-KR";
		
		JSONObject json = readJsonFromUrl(url);
		
		return json;
		
	}
	
	/**
	 * 영화 포스터 가져오기
	 * @param movieId
	 * @param size "w92", "w154", "w185", "w342", "w500", "w780" 중 하나
	 * @return String
	 */
	public static String getMoviePosterPath(int movieId, String size) {
		
		String url = null;
		
		String moviePosterPath = new MovieService().getMoviePosterPath(movieId);
		
		// 경로가 있을 경우
		if(moviePosterPath != null) {
			
			url = "http://image.tmdb.org/t/p/" + size + moviePosterPath;
			
		}
		
		return url;
		
	}

	/**
	 * 영화 배경 가져오기
	 * @param movieId
	 * @param size "w300","w780","w1280","original" 중 하나
	 * @return String
	 */
	public static String getMovieBackdropPath(int movieId, String size) {
		
		String url = null;
		
		String movieBackdropPath = new MovieService().getMovieBackdropPath(movieId);
		
		// 경로가 있을 경우
		if(movieBackdropPath != null) {
			
			url = "http://image.tmdb.org/t/p/" + size + movieBackdropPath;
			
		}
		
		return url;
		
	}
	
    // -------------------- JSON 처리용 시작 --------------------
	
    /**
     * JSON toString
     * @param reader
     * @return String
     * @throws IOException
     */
    private static String jsonReadAll(Reader reader) throws IOException{
    	
        StringBuilder sb = new StringBuilder();

        int cp;
        
        while((cp = reader.read()) != -1){
        	
            sb.append((char) cp);
        }

        return sb.toString();
    }

	
    /**
     * URL에서 JSON toString -> JSON Object
     * @param url
     * @return JSON Object
     * @throws IOException
     * @throws JSONException
     */
    private static JSONObject readJsonFromUrl(String url) throws IOException, JSONException{
    	
        InputStream is = new URL(url).openStream();

        try{
        	
            BufferedReader br = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            
            String jsonText = jsonReadAll(br);
            
            JSONObject json = new JSONObject(jsonText);
            
            return json;
            
        } finally {
            is.close();
        }
        
    }
	
    // -------------------- JSON 처리용 끝 --------------------
    
    
}
