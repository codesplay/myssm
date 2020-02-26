package pers.myssm.domain;

import java.util.List;

public class OrderList {
	
	private Integer order_nums;//每个订单的商品数量
	private List<Order> orderList;
	private List<Product> productList;
	public OrderList(Integer order_nums, List<Order> orderList, List<Product> productList) {
		this.order_nums = order_nums;
		this.orderList = orderList;
		this.productList = productList;
	}
	public Integer getOrder_nums() {
		return order_nums;
	}
	public void setOrder_nums(Integer order_nums) {
		this.order_nums = order_nums;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	@Override
	public String toString() {
		return "OrderList [order_nums=" + order_nums + ", orderList=" + orderList + ", productList=" + productList
				+ "]";
	}
	
	

}
