package pers.myssm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.swing.event.ListSelectionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pers.myssm.domain.Cart;
import pers.myssm.domain.Product;
import pers.myssm.domain.User;
import pers.myssm.service.impl.CartServiceImpl;
import pers.myssm.service.impl.ProductServiceImpl;
import pers.myssm.service.impl.UserServiceImpl;

@Controller
public class CartController {

	@Autowired
	private CartServiceImpl cartServiceImpl;

	@Autowired
	private ProductServiceImpl productServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl;

	@RequestMapping("/mycart")
	public String getCart(HttpSession session, Map<String, Object> map) {
		List<Product> products = new ArrayList<Product>();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Cart> carts = cartServiceImpl.getAllByUser(user.getId());
			for (Cart cart : carts) {
				products.add(productServiceImpl.getProducById(cart.getProduct_id()));
			}
			map.put("carts", carts);
			map.put("products", products);
			return "cart";
		} else {
			return "Jlogin";
		}
	}
	
	//用户界面
	@RequestMapping("/delcart")
	public String delCart(@RequestParam("id")Integer id) {
		System.out.println("删除购物车");
		cartServiceImpl.delCate(id);
		return "redirect:/mycart";
	}

	@RequestMapping("/addcart")
	public String addCart(Cart cart) {
		if(cart.getUser_id() == null){
			return "Jlogin";
		}else{
			System.out.println("userid"+cart.getUser_id()+"product_id"+cart.getProduct_id());
			Cart cart2 = cartServiceImpl.getCartByUP(cart.getUser_id(), cart.getProduct_id());
			if( cart2 == null){
				System.out.println("尚未购买此物品");
				cart.setBuymoney(cart.getBuymoney()*cart.getNum());
				cartServiceImpl.addCate(cart);
			}else {
				System.out.println("商品已在购物车中");
				Double money = cart2.getBuymoney()+cart.getBuymoney()*cart.getNum();
				cart2.setBuymoney(money);
				int num = cart2.getNum()+cart.getNum();
				cart2.setNum(num);
				System.out.println("cartid"+cart.getId());
				cartServiceImpl.updateCart(cart2);
			}
			return "redirect:/mycart";
		}
	}

	/**
	 * 管理员界面
	 * @return
	 */
	@RequestMapping("/carts")
	public String adminList(Map<String , Object> map){
		List<Cart> cartlist = cartServiceImpl.getAll();
		List<Product> prolist = new ArrayList<Product>();
		List<String> userlist = new ArrayList<String>();
		for(Cart cart : cartlist){
			prolist.add(productServiceImpl.getProducById(cart.getProduct_id()));
			userlist.add(userServiceImpl.getUserNameById(cart.getId()));
		}
		map.put("product",prolist);
		map.put("user", userlist);
		map.put("carts", cartlist);
		return "Cart/list";
	}
	
	@RequestMapping("/delcart/{id}")
	public String adminDel(@PathVariable("id")Integer id){
		cartServiceImpl.delCate(id);
		return "redirect:/carts";
	}
	
	
	//修改
	@RequestMapping("/editcartpage")
	public String editpage(@RequestParam("id") Integer id){
		return "Cart/add";
	}
	
	@ModelAttribute("edit_cart")
	public void getcart(@RequestParam(value="id",required=false)Integer id,Map<String, Object> map){
		if(id != null){
			System.out.println("获取cart");
			map.put("edit_cart",cartServiceImpl.getCartById(id));
		}
	}
	@RequestMapping("/editcart")
	public String editcart(@ModelAttribute("edit_cart") Cart cart){
		
		Double sales = productServiceImpl.getSalesById(cart.getProduct_id());
		if(sales != 0){
			cart.setBuymoney(sales*(cart.getNum()));
		}else{
			Double price = productServiceImpl.getPriceById(cart.getProduct_id());
			cart.setBuymoney(price*(cart.getNum()));
		}
		System.out.println("修改"+cart.toString());
		cartServiceImpl.updateCart(cart);
		return "redirect:/carts";
	}
	
	

}
