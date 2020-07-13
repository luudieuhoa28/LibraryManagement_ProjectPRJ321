/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;
import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

//import com.google.gson.Gson;
//import com.google.gson.JsonObject;

import org.json.simple.JSONObject;

//import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Admins
 */
public class GoogleUtils {
    
    final static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    final static String GOOGLE_CLIENT_ID = "321765933526-j5blsda3p6483mjffa9djo9peqh2j16p.apps.googleusercontent.com";
    final static String GOOGLE_CLIENT_SECRET = "j-Xd5Iir318t-oBiiRiUzhtO";
    final static String GOOGLE_REDIRECT_URI = "http://localhost:8084/FinalProjectPRJ321/googlecallback";
     final static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    final static String GOOGLE_GRANT_TYPE = "authorization_code";
     public static String getToken(final String code) throws ClientProtocolException, IOException, ParseException {
    String response;
        response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri",GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type",GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
       //
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(response);
       JSONObject obj2 = (JSONObject)obj;
       String accessToken = obj2.get("access_token").toString().replaceAll("\"", "");
        
      return accessToken;
  }
     public static String getUserInfo(final String accessToken) throws IOException, ParseException{
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(response);
        JSONObject obj2 = (JSONObject)obj;
        System.out.println(obj2);
        return obj2.get("email").toString();
     }

}