package pers.myssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import pers.myssm.domain.Cart;
@Repository
public interface CartDao {
	
	@Select("select * from tbl_cart order by user_id")
	public List<Cart> findAll();
	
	@Delete("delete from tbl_cart where id = #{id}")
	public void delCart(Integer id);
	
	@Update("update tbl_cart set num=#{num},user_id=#{user_id},product_id=#{product_id},buymoney=#{buymoney} where id = #{id}")
	public void updateCart(Cart cart);
	
	@Insert("insert into tbl_cart (num,user_id,product_id,buymoney) values(#{num},#{user_id},#{product_id},#{buymoney})")
	public void addCart(Cart cart);
	
	@Select("select * from tbl_cart where user_id = #{id}")
	public List<Cart> findAllByUser(Integer id);
	
	@Select("select * from tbl_cart where id = #{id}")
	public Cart findCartById(Integer id);
}
