package pers.myssm.service;

import java.util.List;

import pers.myssm.domain.Cart;
import pers.myssm.domain.Procate;

public interface CartService {
	
	
	public List<Cart> getAll();
	
	public void delCate(Integer id);
	
	public void updateCate(Cart cart);
	
	public void addCate(Cart cart);
	
	public List<Cart> getAllByUser(Integer id);
	
	public Cart getCartById(Integer id);
}
