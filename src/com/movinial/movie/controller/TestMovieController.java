package com.movinial.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import static com.movinial.common.MovieTemplate.*;

/**
 * Servlet implementation class TestMovieController
 */
@WebServlet("/movie.test")
public class TestMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int movieId = 577922;

        JSONObject json = getMovieDetail(movieId);

        request.setAttribute("json", json);
        request.getRequestDispatcher("views/movie/test111.jsp").forward(request, response);

    }
//
//	// String
//    private static String jsonReadAll(Reader reader) throws IOException{
//        StringBuilder sb = new StringBuilder();
//
//        int cp;
//        while((cp = reader.read()) != -1){
//            sb.append((char) cp);
//        }
//
//        return sb.toString();
//    }
//
//	// JSONObject
//    private static JSONObject readJsonFromUrl(String url) throws IOException, JSONException{
//        InputStream is = new URL(url).openStream();
//
//        try{
//        	
//            BufferedReader br = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
//            String jsonText = jsonReadAll(br);
//            JSONObject json = new JSONObject(jsonText);
//            
//            return json;
//        } finally {
//            is.close();
//        }
//        
//    }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
