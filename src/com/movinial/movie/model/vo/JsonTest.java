package com.movinial.movie.model.vo;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonTest {
	public static void main(String ar[]) throws Exception{
		
		// GSON 객체 생성
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String api = "";
        //String url = "https://api.themoviedb.org/3/configuration?api_key=" + api;
		
		// 장르ID: 28, 12, 16, 35, 80, 99, 18, 10751, 14, 36, 27, 10402, 9648, 10749, 878, 10770, 53, 10752, 37
		int[] genreArr = {28, 12, 16, 35, 80, 99, 18, 10751, 14, 36, 27, 10402, 9648, 10749, 878, 10770, 53, 10752, 37};
		
		String result = "";
		
		for(int i = 0; i < genreArr.length; i++) {
			for(int j = 1; j <= 10; j++) { // 1 ~ 10 페이지까지 출력
				String url = "https://api.themoviedb.org/3/discover/movie?api_key=" + api
						+ "&language=ko-KR&sort_by=popularity.desc&include_adult=false&include_video=false&page=" + j
								+ "&with_genres=" + genreArr[i]
										+ "&with_watch_monetization_types=flatrate";
				
				System.out.println(url);
				
				JSONObject json = readJsonFromUrl(url);
				
				result += json; // JSON => String
				
			}
			
		}
		
		// String => JSON
		JSONObject resultJson = new JSONObject(result);
		
		// JSON 합치기용
		FileWriter fw = new FileWriter("C:\\movinial\\movieDB\\movieDB.json");
		gson.toJson(resultJson, fw);
		
		fw.flush();
		fw.close();
		
    }

	// String
    private static String jsonReadAll(Reader reader) throws IOException{
        StringBuilder sb = new StringBuilder();

        int cp;
        while((cp = reader.read()) != -1){
            sb.append((char) cp);
        }

        return sb.toString();
    }

	// JSONObject
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
	
}
