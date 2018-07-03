package test;

import java.io.IOException;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class P2 {
	
	public static void main(String[] args) throws IOException {
		Scanner sc = new Scanner(System.in);
		Document doc = Jsoup.connect("https://sports.news.naver.com/worldfootballetc/news/read.nhn?oid=139&aid=0002093590").get();
		
		// Elements - 속성을 지정해 선택하는 객체
		// strong css 속성 가져오기
		// css 속성 뿐 아니라 id, class 값도 가져올 수 있다.
		Elements span = doc.select("span");
		span.remove();
		
		Elements str = doc.select("a");
		System.out.println(str);
		
		
		/*System.out.println("크롤링 하고 싶은 태그를 입력하라") ;
		Elements body = doc.select(sc.nextLine());
		System.out.println(body.text());*/
		
	}
}
