package test;
// 하이퍼링크 내용 들어가서 끌어오기
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Random;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class P4 {
	public static void main(String[] args) throws IOException {
		/*Document doc = Jsoup.connect("http://news.naver.com").get();
		Elements a = doc.select("a");
		
		for (Element el : a) {
			//System.out.println(el.attr("href").indexOf("http://news.naver.com",0));
			if(el.attr("href").indexOf("http://news.naver.com", 0)>=0) { // http://news.naver.com < 로 시작하는 위치를 찾아 0보다 크다면 ? = 있다면
				Document subdoc = Jsoup.connect(el.attr("href")).get(); // doc을 새로 생성해줄건데 커넥션을 href 안으로 들어갈거다
				Elements el2 = subdoc.select("#articleBodyContents"); // 하이퍼링크 들어간 내용중 class{articleBodyContetns}만 가져올 것
				String str = el2.text(); // 텍스트로 변환하기
				System.out.println(str); // 출력
			}
			
		}*/
	}
}
