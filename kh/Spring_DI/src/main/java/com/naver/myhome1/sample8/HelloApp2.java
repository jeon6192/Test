package com.naver.myhome1.sample8;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample8/applicationContext.xml");
		CollectionBean collectionBean = (CollectionBean) ctx.getBean("collectionBean");
		
		Map<String, String> map = collectionBean.getAddressList();

		
		Iterator<Entry<String, String>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, String> entry = (Entry<String, String>) it.next();
			System.out.println(entry.getKey() + " : " + entry.getValue());
		}
		
		
		Iterator<String> it2 = map.keySet().iterator();
		while (it2.hasNext()) {
			String key = it2.next();
			System.out.println(key + " : " + map.get(key));
		}
		
		
		Set<String> key = map.keySet();
		for(String key2 : key) {
			System.out.println(key2 + " : " + map.get(key2));
		}
		
		ctx.close();
	}
}
