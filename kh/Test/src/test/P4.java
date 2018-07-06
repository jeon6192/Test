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
		
		Document doc = Jsoup.connect(
				"http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC")
				.get();
		Elements a = doc.select("span.fc_blue.count");
		
		int result = Integer.parseInt(a.text().replaceAll(",", ""))/5;
		String text = "";
		
		/*for (int i = 1; i <= result; i++) {
			String str = "http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC&page="
					+ i;
			Document doc2 = Jsoup.connect(str)
				     .userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36")
				     .get();

			Elements name = doc2.select("a.link_tit");
			Elements addr = doc2.select("li.item div.clear_g:eq(0) div.desc");
			
			for (Element el3 : addr) {
				try {
			      Thread.sleep(100);
			    } catch (InterruptedException e) { }
				System.out.println(el3.text());
				//text += el3.text();
				//text += "\r\n";
			}
		}*/
		
		
		
		String str = "http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC&page=1";
		Document doc2 = Jsoup.connect(str)
			     .userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36")
			     .get();

		Elements name = doc2.select("a.link_tit");
		Elements addr = doc2.select("li.item").eq(4).select(" div.clear_g").not(" div.clear_g.evaluation_grade").select(" div.desc");
		
		/*for (Element el3 : addr) {
			try {
		      Thread.sleep(100);
		    } catch (InterruptedException e) { }
			System.out.println(el3.text());
			//text += el3.text();
			//text += "\r\n";
		}*/
		System.out.println(addr.size());
		for (int i =0; i < addr.size(); i++) {
			try {
		      Thread.sleep(100);
		    } catch (InterruptedException e) { }
			System.out.println(addr.get(i).text());
			//text += el3.text();
			//text += "\r\n";
			if((i+1)%4==0)	System.out.println();
		}
		
		
		
		
		
	}
}
