package pers.myssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.MediaSize.Other;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Port;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pers.myssm.domain.Order;
import pers.myssm.domain.OrderList;
import pers.myssm.domain.Product;
import pers.myssm.domain.User;
import pers.myssm.service.impl.OrderServiceImpl;
import pers.myssm.service.impl.ProductServiceImpl;
import pers.myssm.service.impl.UserServiceImpl;
import pers.myssm.utils.SnowflakeIdFactory;

/**
 * 
 * 中文乱码！！！！！！！！！！！！！
 * ！！！！！！！！！！eclipse：widow->Perference->General->Workspace：是utf-8，说明不是这里的问题。！！！！
 * ！！！！ 右击项目，选择Properties->Resource：也是utf-8，说明不是这里的问题。
 * 右击类，选择Properties->Resource：也是utf-8，说明不是这里的问题。 src->webapp下我web.xml： 解决：在
 * <Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1"
 * redirectPort="8443" URIEncoding="UTF-8"/>加上URIEncoding="UTF-8。
 * 
 * @author IMFINE
 *
 */
@Controller
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private ProductServiceImpl productService;

	@Autowired
	private SnowflakeIdFactory snow;

	private List<Order> ordersList = new ArrayList<Order>();

	// cart到orderinfo 将要形成订单的商品
	@RequestMapping(value = "/addorder", method = RequestMethod.POST)
	@ResponseBody
	public String addorder(@RequestBody List<Order> order) {
		ordersList.clear();
		System.out.println("addorder");
		for (Order or : order) {
			ordersList.add(or);
		}
		return "success";
	}

	// 形成order 跳转到order页面
	@RequestMapping("/myorders")
	public String buyproduct(@RequestParam(value = "error", required = false) Integer error, HttpSession session,
			Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Order> list = orderService.getAllByUser(user.getId());// 按日期分组查询
			// 保存订单类
			List<OrderList> orderList = new ArrayList<OrderList>();
			// 保存订单内容
			List<Order> orderList1 = new ArrayList<Order>();
			// 保存订单商品
			List<Product> productList = new ArrayList<Product>();
			/**
			 * 1、获取订单里面购买商品订单号 2、便利获取的用户订单，通过判断订单号是否相同判断是否同一个订单
			 * 
			 */
			Long numLong = list.get(0).getOrdernum();
			int list_nums = 0, index = 0;
			System.out.println("形成订单=========");
			for (Order order : list) {
				++list_nums;
				if ((order.getOrdernum()).longValue() != numLong.longValue()) {
					// 保存订单
					orderList.add(new OrderList(index, orderList1, productList));
					// 设置新订单号
					numLong = order.getOrdernum();
					// 清空旧数据
					index = 1;
					orderList1 = new ArrayList<Order>();
					productList = new ArrayList<Product>();
					// 添加新订单
					orderList1.add(order);
					productList.add(productService.getProducById(order.getProduct_id()));
					if (list_nums == list.size()) {
						orderList.add(new OrderList(1, orderList1, productList));
					}

				} else {
					++index;
					// 保存同一订单
					orderList1.add(order);
					// 保存订单中的product
					productList.add(productService.getProducById(order.getProduct_id()));
				}
			}
			if (list.size() == index) {
				orderList.add(new OrderList(index, orderList1, productList));
			}

			// List<Product> products = new ArrayList<Product>();
			// List<Order> list = orderService.getAll();
			// List<String> nameList = new ArrayList<String>();
			// for(Order order:list){
			// products.add(productService.getProducById(order.getProduct_id()));
			// nameList.add(userService.getUserNameById(order.getUser_id()));
			// }
			// map.put("products",products);
			// map.put("orders", list);
			// map.put("username", nameList);
			System.out.println(orderList.toString());
			map.put("OrderList", orderList);
			if (error != null) {
				map.put("error", error);
			}
			return "order";
		} else {
			return "Jlogin";
		}
	}

	// 展示从购物车选中的订单
	@RequestMapping("/postorder")
	public String getOrder(Map<String, Object> map) {
		List<Product> products = new ArrayList<Product>();
		Product product;
		int amount = 0;
		Double summoney = 0.0;
		for (Order order : ordersList) {
			product = productService.getProducById(order.getProduct_id());
			products.add(product);
			amount += order.getBuynum();
			summoney += order.getBuymoney();
			if (order.getBuynum() > product.getPronums()) {
				map.put("nums", 0);
				// model.addObject("nums",0);
			} else {
				// model.addObject("nums", 1);
				map.put("nums", 1);
			}
		}
		System.out.println("postorder");
		// model.addObject("summoney", summoney);
		// model.addObject("amount", amount);
		// model.addObject("products", products);
		// model.addObject("orders", orders);
		map.put("summoney", summoney);
		map.put("amount", amount);
		map.put("products", products);
		map.put("orders", ordersList);
		return "orderinfo";
	}

	// 提交订单 存入数据库
	@RequestMapping("/submitorder")
	@ResponseBody
	public List<String> insertOrder(@RequestBody List<Order> orders, @RequestParam("phone") String phone,
			@RequestParam(value = "username") String username, @RequestParam("email") String email) {
		List<String> nums = new ArrayList<String>();
		Double de = 0.0;
		System.out.println("phone" + phone + "orderuser" + username + "email" + email);
		long nums1 = snow.nextId();
		for (Order or : orders) {
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			or.setOrdertime(sdf.format(d));
			or.setOrdernum(nums1);
			de += or.getBuymoney();
			// 追加保存phone user email
			or.setEmail(email);
			or.setPhone(phone);
			or.setOrderuser(username);
			orderService.addOrder(or);

		}
		nums.add(String.valueOf(de));
		nums.add(String.valueOf(nums1));
		return nums;
	}

	// 订单提交成功页面
	@RequestMapping("/succorder")
	public String buyorder(@RequestParam("nums") List<String> str, Map<String, Object> map) {
		map.put("num", str.get(1));
		map.put("money", str.get(0));
		return "succorder";
	}

	@RequestMapping("/buyorder/{id}")
	public String buyorder(@PathVariable("id") Integer id) {

		return "success";
	}

	// 订单管理
	@RequestMapping("/orders")
	public String adminorders(Map<String, Object> map) {
		List<Order> orders = orderService.getAll();
		List<String> pro = new ArrayList<String>();
		List<String> user = new ArrayList<String>();
		for (Order order : orders) {
			user.add(userService.getUserNameById(order.getUser_id()));
			pro.add(productService.getProducById(order.getProduct_id()).getProdesc());
		}
		map.put("orders", orders);
		map.put("product", pro);
		map.put("user", user);
		return "Order/list";
	}

	// 订单删除
	@RequestMapping("/delorder/{id}")
	public String delorder(@PathVariable("id") Integer id) {
		orderService.delOrder(id);
		return "redirect:/orders";
	}

	// 订单修改
	@RequestMapping("/editorderpage")
	public String geteditpage(@RequestParam("id") Integer id) {
		return "Order/add";
	}

	@ModelAttribute("edit_order")
	public void getOrder(@RequestParam(value = "id", required = false) Integer id, Map<String, Object> map) {
		if (id != null) {
			System.out.println("获取order");
			map.put("edit_order", orderService.getById(id));
		}
	}

	@RequestMapping("/editorder")
	public String editorder(@ModelAttribute("edit_order") Order order) {
		System.out.println("修改" + order.toString());
		orderService.updateOrder(order);
		return "redirect:/orders";
	}

}
