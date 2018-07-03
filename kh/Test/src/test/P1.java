package test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;

import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;

public class P1 {
	// 크롤링 하기
	// 기본작업 1. Response 객체 생성 = Jsoup.connect("링크").method(Method.GET).execute();
	//			2. 받아온 Res객체 Document에 담기 > 담은 후 html 문자열형태 , 텍스트만 가져오기 등 가공 가능
	// jsoup core library 다운 및 적용
	public static void main(String[] args) throws IOException {
		// 1. 응답객체(Response 객체 생성)
		// Jsoup.connect("원하는 링크").method(Method.GET).execute();
		Response res = Jsoup.connect("https://sports.news.naver.com/worldfootballetc/news/read.nhn?oid=139&aid=0002093590").method(Method.GET).execute();
		
		// 2. 응답객체(Res)를 파싱하여 우리가 원하는 값을 Document 형식으로 저장할 것
		Document doc =  res.parse();
		// 전체 코드 출력
		//System.out.println(doc);
		//System.out.println(doc);
		// 3. html 코드 형태를 String으로 바꾸기
		String p1 = doc.html();
		//System.out.println(p1);
		
		// 4. doc 객체 생성한 것에서 html태그 제외한 텍스트만 가져오기
		String p2 = doc.text();
		System.out.println(p2);
		
		
		
		// 403 에라 발생 안하면 바로 Doc로 받아오기 가능
		// 에러 발생 시 위에 방법으로 해야 함
		Document doc2 = Jsoup.connect("https://sports.news.naver.com/worldfootballetc/news/read.nhn?oid=139&aid=0002093590").get();
		
		String p3 = doc2.text();
		//System.out.println(p3);
		
	}
	
}
