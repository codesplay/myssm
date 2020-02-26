package pers.myssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.myssm.dao.ProductDao;
import pers.myssm.domain.Product;
import pers.myssm.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	public List<Product> getProductByName(String username) {
		return productDao.findByName(username);
	}

	@Override
	public List<Product> getProductByBrand(String brand) {
		return productDao.findByBrand(brand);
	}

	@Override
	public List<Product> getProductByCate(Integer cate) {
		// TODO Auto-generated method stub
		return productDao.findByCate(cate);
	}

	@Override
	public List<Product> getAll() {
		// TODO Auto-generated method stub
		return productDao.getAll();
	}

	@Override
	public void saveProduct(Product product) {
		productDao.addProduct(product);
		
	}

	@Override
	public void delProduct(Integer id) {
		// TODO Auto-generated method stub
		productDao.delProduct(id);
	}

	@Override
	public void updata(Product product) {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);
	}

	@Override
	public Product getProducById(Integer id) {
		return productDao.findById(id);
	}

	@Override
	public List<Product> getAllByCate(Integer i) {
		return productDao.findAllByCate(i);
		
	}

	@Override
	public List<Product> getAllFireRang(Integer i) {
		return productDao.findAllBySale(i);
	}
	
	public Double getPriceById(Integer id){
		return productDao.findPriceById(id);
	}
	
	public Double getSalesById(Integer id){
		return productDao.findSalesById(id);
	}
	

}
