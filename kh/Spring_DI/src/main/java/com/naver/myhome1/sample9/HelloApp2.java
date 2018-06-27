package com.naver.myhome1.sample9;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample9/applicationContext.xml");
		CollectionBean collectionBean = (CollectionBean) ctx.getBean("collectionBean");
		
		Properties props = collectionBean.getAddressList();

		
		Iterator<Entry<Object, Object>> it = props.entrySet().iterator();
		while (it.hasNext()) {
			Entry<Object, Object> entry = (Entry<Object, Object>) it.next();
			System.out.println(entry.getKey() + " : " + entry.getValue());
		}
		
		
		Iterator<Object> it2 = props.keySet().iterator();
		while (it2.hasNext()) {
			Object key = it2.next();
			System.out.println(key + " : " + props.get(key));
		}
		
		
		Set<Object> key = props.keySet();
		for(Object key2 : key) {
			System.out.println(key2 + " : " + props.get(key2));
		}
		
		Set<String> key3 = props.stringPropertyNames();
		for(String key4 : key3) {
			System.out.println(key4 + " : " + props.get(key4));
		}
		ctx.close();
	}
}
