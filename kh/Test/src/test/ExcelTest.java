package test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelTest {
	public static void main(String[] args) throws Exception {
		WritableWorkbook workbook = null;
		WritableSheet sheet = null;

		java.io.File excelFile = new java.io.File("D:/test/test.cell");
		Label label = null;

		Document doc = Jsoup.connect(
				"http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC")
				.get();
		Elements a = doc.select("span.fc_blue.count");

		int result = Integer.parseInt(a.text().replaceAll(",", ""))/5;
		String text = "";


		workbook = Workbook.createWorkbook(excelFile);
		workbook.createSheet("구로구", 0);
		sheet = workbook.getSheet(0);
		
		for (int i = 0; i < result; i++) {
			
			String str = "http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC&page="
					+ (i+1);
			Document doc2 = Jsoup.connect(str).userAgent("Mozilla").get();
	
			Elements name = doc2.select("a.link_tit");
			
			for (int j = 0; j < 5; j++) {
				System.out.println(i);
				Elements info = doc2.select("li.item").eq(j).select(" div.clear_g").not(" div.clear_g.evaluation_grade").select(" div.desc");
				Thread.sleep(80);
				
				label = new Label(0, (i*5)+1+j, name.get(j).text());
				sheet.addCell(label);
				for(int q = 0; q < info.size(); q++) {
					label = new Label(q+1, (i*5)+1+j, info.get(q).text());
					sheet.addCell(label);
				}
				
			}
		}
		
		workbook.write();
		workbook.close();
	}
}
