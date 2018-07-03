package test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class dd {
	public static void main(String[] args) throws IOException {
		/*Document doc = Jsoup.connect("http://news.naver.com").get();
		Elements a = doc.select("a");
		String str = "";
		for (Element el : a) {
			str += el.attr("href");
			str += "\r\n";
		}
		
		
		// NIO
		// 1.Path 생성
		Path path = Paths.get("D:/java/test/180701.txt");
		
		// 2. 채널 생성
		FileChannel file = FileChannel.open(path, StandardOpenOption.CREATE,StandardOpenOption.WRITE);
		
		// 3. 바이트버퍼 생성
		ByteBuffer bb = ByteBuffer.wrap(str.getBytes());
		
		// ㅇㅇ
		file.write(bb);
		bb.clear();
		file.close();*/
		
		Document doc = Jsoup.connect("http://www.hidoc.co.kr/find/result/list?searchType=area&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B0%95%EB%82%A8%EA%B5%AC&area3=%EC%82%BC%EC%84%B1%EB%8F%99").get();
		Elements a = doc.select("span.fc_blue.count");
		
		int result = Integer.parseInt(a.text());
		
		for (int i = 1; i <= result/5; i++) {
			String str = "http://www.hidoc.co.kr/find/result/list?searchType=area&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B0%95%EB%82%A8%EA%B5%AC&area3=%EC%82%BC%EC%84%B1%EB%8F%99&page="+i;
			
			//Response res = Jsoup.connect(str).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").method(Method.GET).execute();
			//Document doc2 = res.parse();
			Document doc2 = Jsoup.connect(str).userAgent("Mozilla").get();
			
			Elements el2 = doc2.select("a.link_tit");
			for (Element el3 : el2) {
				try {
			      Thread.sleep(200);
			    } catch (InterruptedException e) { }
				System.out.println(el3.text());
			}
		}
		
	}
}
