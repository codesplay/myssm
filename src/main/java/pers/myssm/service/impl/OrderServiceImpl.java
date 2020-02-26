package pers.myssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.myssm.dao.OrderDao;
import pers.myssm.domain.Order;
import pers.myssm.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	public List<Order> getAll() {
		return orderDao.findAll();
	}

	public Order getById(Integer id) {
		return orderDao.fingById(id);
	}

	@Override
	public void updateOrder(Order order) {
		orderDao.updateOrder(order);
	}

	@Override
	public void delOrder(Integer id) {
		orderDao.delOrder(id);
		
	}

	@Override
	public void addOrder(Order order) {
		orderDao.addOrder(order);
		
	}

	public List<Order> getAllByUser(Integer id) {
		// TODO Auto-generated method stub
		return orderDao.fingByUser(id);
	}

	@Override
	public Order getAllByOrdernum(Long num) {
		return orderDao.findByOrdernum(num);
	}

	@Override
	public List<Order> getAllByOrdernum() {
		return orderDao.findAllByOrder();
	}

	@Override
	public List<Order> getAllByOrdertime() {
		return orderDao.findAllByTime();
	}

	@Override
	public List<Order> getAllByNUM(Long num) {
		return orderDao.findAllByOrdernum(num);
	}

	@Override
	public void updateStatus(Integer status, Long ordernum) {
		orderDao.updateStatus(status, ordernum);
	}

	@Override
	public List<Order> getAllBystatus(Integer statu,Integer userid) {
		return orderDao.findByStatus(statu,userid);
	}

	@Override
	public void updateStatusById(Integer status, Integer id) {
		orderDao.updateStatusById(status, id);
	}
	
	



}
