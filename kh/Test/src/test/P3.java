package test;
// Element 활용 , 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;

public class P3 {
	public static void main(String[] args) throws IOException {
		Response res = Jsoup.connect("http://news.naver.com").method(Method.GET).execute();
		
		Document doc = res.parse();
		Elements span = doc.select("span");
		span.remove();
		Elements a = doc.select("a");
		
		for (Element el : a) {
			System.out.println(el);
			System.out.println(el.text());
		}
		
	}
}
