package pers.myssm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.myssm.domain.Address;
import pers.myssm.service.impl.AddressServiceImpl;

@Controller
public class AddressController {

	@Autowired
	private AddressServiceImpl addressService;
	
	@RequestMapping("addrinsert")
	@ResponseBody
	public Address insertAddress(@RequestBody Address address){
		addressService.add(address);
		return address;
	}
	
	@RequestMapping("addrget")
	public String getAddress(Integer user_id,Integer product_id,Map<String, Object> map) {
		map.put("addres", addressService.select(user_id, product_id));
		return "";
	}
	
	@RequestMapping("addrupdate")
	public String update(Address address){
		addressService.update(address);
		return "";
	}
	
	@RequestMapping("addrdel")
	public String delete(Integer id){
		addressService.delete(id);
		return "";
	}
	
}
