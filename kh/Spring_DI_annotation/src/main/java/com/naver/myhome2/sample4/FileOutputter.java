package com.naver.myhome2.sample4;

import java.io.FileWriter;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FileOutputter implements Outputter{
	private String filePath;

	public FileOutputter() {
		System.out.println("1. 여기는 FileOutputter 생성자");
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
		System.out.println("5. 여기는 FIleOutputter.java의 setter 입니다");
	}


	@Override
	public void output(String message) throws IOException {
		System.out.println("7. 여기는 FileOutputter.java의 output() 입니다");
		FileWriter out = new FileWriter(filePath);
		out.write(message);
		out.close();
	}
	
	
}
