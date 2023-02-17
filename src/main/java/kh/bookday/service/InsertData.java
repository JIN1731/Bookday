package kh.bookday.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kh.bookday.dao.MemberDAO;
import kh.bookday.dto.BookDTO;


public class InsertData {
	
	@Autowired
private static BookService service;

	
	public static void main(String[] args) {
		
		try {
			service.setBookData();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
