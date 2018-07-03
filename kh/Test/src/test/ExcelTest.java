package test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
		for (int i = 1; i <= result; i++) {
			String str = "http://www.hidoc.co.kr/find/result/list?searchType=area&filterType=HD&orderType=15010&area1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&area2=%EA%B5%AC%EB%A1%9C%EA%B5%AC&page="
					+ i;
			Document doc2 = Jsoup.connect(str).userAgent("Mozilla").get();

			Elements name = doc2.select("a.link_tit");
			Elements addr = doc2.select("li.item div.clear_g:eq(0) div.desc");
			Elements tel = doc2.select("li.item div.clear_g:eq(1) div.desc");
			Elements type = doc2.select("li.item div.clear_g:eq(2) div.desc");
			Elements subject = doc2.select("li.item div.clear_g:eq(3) div.desc");
			
			
			for (int j = 0; j < 5; j++) {
				Thread.sleep(80);
				label = new Label(0, i, name.get(j).text());
				sheet.addCell(label);
				label = new Label(1, i, addr.get(j).text());
				sheet.addCell(label);
				label = new Label(2, i, tel.get(j).text());
				sheet.addCell(label);
				label = new Label(3, i, type.get(j).text());
				sheet.addCell(label);
				label = new Label(4, i, subject.get(j).text());
				sheet.addCell(label);
			}

		}
		workbook.write();
		workbook.close();
	}
}
