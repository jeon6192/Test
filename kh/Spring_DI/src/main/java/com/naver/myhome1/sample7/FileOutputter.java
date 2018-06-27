package com.naver.myhome1.sample7;

import java.io.FileWriter;
import java.io.IOException;

public class FileOutputter implements Outputter{
	private String filePath;

	
	
	public FileOutputter() {
		System.out.println("2. 여기는 FileOutputter 생성자");
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath; // out.txt 주입되었습니다.
		System.out.println("3. 여기는 FIleOutputter.java의 setter 입니다");
	}


	@Override
	public void output(String message) throws IOException {
		System.out.println("7. 여기는 FileOutputter.java의 output() 입니다");
		FileWriter out = new FileWriter(filePath);
		out.write(message);
		out.close();
	}
	
	
}
