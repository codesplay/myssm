package pers.myssm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.domain.MpPrizeInfoModel;
import com.alipay.api.domain.OrderRefundInfo;

import pers.myssm.domain.Comment;
import pers.myssm.domain.Order;
import pers.myssm.domain.Product;
import pers.myssm.service.impl.CommentServiceImpl;
import pers.myssm.service.impl.OrderServiceImpl;
import pers.myssm.service.impl.ProductServiceImpl;

@Controller
public class CommentController {
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@Autowired
	private ProductServiceImpl productService;
	
	@Autowired
	private OrderServiceImpl orderService;
	
	//待评价列表
	@RequestMapping("/mycomments")
	public String addComment(@RequestParam("id")Integer id,Map<String, Object> map){
		List<Order> orderList =  orderService.getAllBystatus(1,id);
		List<Product> productList = new ArrayList<Product>();
		for(Order order : orderList){
			productList.add(productService.getProducById(order.getProduct_id()));
		}
		map.put("orderList",orderList);
		map.put("productList", productList);
		return "mycomments";
	}
	
	//编辑界面
	@RequestMapping("/editcomment")
	public String editComment(@RequestParam("id") Integer id,Map<String, Object> map){
		//根据订单id获取product的id
		System.out.println("订单id："+id);
		map.put("product", productService.getProducById(orderService.getById(id).getProduct_id()));
		map.put("order_id", id);
		map.put("user_id", orderService.getById(id).getUser_id());
		return "comments";
	}
	
	//保存评价
	@RequestMapping("addcomment")
	public String addComment(@RequestParam("order_id")Integer id,Comment comment){
		commentService.add(comment);
		//根据订单id修改状态 已评价 ---2
		orderService.updateStatusById(2, id);
		return "redirect:/mycomments?id="+comment.getUser_id();
	}

	@RequestMapping("/getcomments")
	@ResponseBody
	public List<Comment> getComments(@RequestParam("id") Integer id){
		return commentService.getAllByPro(id);
	}
}
