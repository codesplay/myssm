package pers.myssm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.taglibs.standard.lang.jstl.Literal;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import pers.myssm.domain.Product;
import pers.myssm.domain.User;

@Repository
public interface ProductDao {

	// 查找所有

	@Select("select * from product")
	public List<Product> getAll();

	// 根据title
	@Select("select * from product where prodesc like '%#{desc}%'")
	public List<Product> findByName(String desc);
	// 根据品牌
	@Select("select * from product where probrand = #{brand}")
	public List<Product> findByBrand(String brand);
	// 根据种类
	@Select("select * from product where procate = #{cate}")
	public List<Product> findByCate(Integer cate);
	
	@Select("select price from product where id = #{id}")
	public Double findPriceById(Integer id);
	
	@Select("select sales from product where id = #{id}")
	public Double findSalesById(Integer id);
	
	// 分组查询
	@Select("select * from product r where #{i} > (select count(*) from "
			+ "product where product.procate = r.procate and product.id < r.id) order by procate")
	public List<Product> findAllByCate(Integer i);
	
	@Select("select * from product as a where #{i}>(select count(*) from product where id=a.id and salenums>a.salenums) "
			+ "ORDER BY procate")
	public List<Product> findAllBySale(Integer i);

	@Select("select * from product where id = #{id}")
	public Product findById(Integer id);

	@Insert("insert into product(prodesc,proimg,probrand,proname,procate,pronums,price,sales,made)"
			+ " values(#{prodesc},#{proimg},#{probrand},#{proname},${procate},${pronums},${price},${sales},#{made})")
	public void addProduct(Product product) throws DuplicateKeyException;

	@Update("update product set prodesc=#{prodesc},proimg=#{proimg},probrand=#{probrand}"
			+ ",proname=#{proname},procate=#{procate},pronums=#{pronums},price=#{price},"
			+ "sales=#{sales},made=#{made} where id = #{id}")
	public void updateProduct(Product product);

	@Delete("delete from product where id = #{id}")
	public void delProduct(Integer id);
}
