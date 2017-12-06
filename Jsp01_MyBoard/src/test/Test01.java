package test;

import java.util.ArrayList;
import java.util.List;

public class Test01 {
	
	public static void main(String[] args) {
		List<Integer> li = new ArrayList<Integer>();
		int a = 0;
		for(int i = 0; i < 10; i++) {
			li.add(i);
		}
		
		for(int i = 0; i < 10; i++) {
			a = li.get(i);
		}
		System.out.println(a);
	}

}
