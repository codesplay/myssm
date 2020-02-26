package pers.myssm.service;

import java.util.List;

import pers.myssm.domain.Order;

public interface OrderService {
	
	public List<Order> getAll();
	
	public List<Order> getAllByUser(Integer id);
	
	public Order getAllByOrdernum(Long num);
	
	public List<Order> getAllByNUM(Long num);
	
	public List<Order> getAllByOrdernum();
	
	public List<Order> getAllByOrdertime();
	
	public List<Order> getAllBystatus(Integer statu,Integer userid);
	
	public Order getById(Integer id);
	
	public void updateOrder(Order order);
	
	public void updateStatus(Integer status,Long ordernum);
	
	public void updateStatusById(Integer status,Integer id);
	
	public void delOrder(Integer id);
	
	public void addOrder(Order order);
}
