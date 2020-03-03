package pers.myssm.service;

import java.util.List;
import java.util.Map;

import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import pers.myssm.domain.Product;

public interface ProductService {

	public Long getNums(String desc);
	
	public List<Product> getAsPage(String desc,Integer begin,Integer nums);
	
	// 查
	public List<Product> getProductByName(String username);

	public List<Product> getProductByBrand(String brand);
	
	public List<Product> getProductByCate(Integer cate);

	public List<Product> getAll();
	
	public Product getProducById(Integer id);
	
	public List<Product> getAllByCate(Integer i);
	
	public Double getPriceById(Integer id);
	
	public Double getSalesById(Integer id);
	//查找每种
	public List<Product> getAllFireRang(Integer i);

	// 增
	public void saveProduct(Product product);

	// 删
	public void delProduct(Integer id);

	// 改
	public void updata(Product product);
}
