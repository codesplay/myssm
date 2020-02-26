package pers.myssm.service.impl;

import java.util.List;
import java.util.zip.CRC32;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.myssm.dao.CartDao;
import pers.myssm.domain.Cart;
import pers.myssm.domain.Procate;
import pers.myssm.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	@Override
	public List<Cart> getAll() {
		return cartDao.findAll();
	}

	@Override
	public void delCate(Integer id) {

		cartDao.delCart(id);
	}

	@Override
	public void updateCate(Cart cart) {
		cartDao.updateCart(cart);
	}

	@Override
	public void addCate(Cart cart) {
		cartDao.addCart(cart);
		
	}
	
	public List<Cart> getAllByUser(Integer id) {
		return cartDao.findAllByUser(id);
		
	}

	public Cart getCartById(Integer id) {
		return cartDao.findCartById(id);
	}

}
