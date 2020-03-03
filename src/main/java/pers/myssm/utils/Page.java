package pers.myssm.utils;

import java.util.List;

public class Page<T>{
	
	private Integer nums;
	private List<T> list;
	
	
	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public static long getPages(Long long1,Integer pages){
		if(long1%pages != 0){
			return long1/pages+1;
		}else {
			return long1/pages;
		}
	}
}