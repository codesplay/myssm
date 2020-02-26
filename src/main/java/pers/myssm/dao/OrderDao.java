package pers.myssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import pers.myssm.domain.Order;

@Repository
public interface OrderDao {
	
	@Select("select * from tbl_order order by user_id")
	public List<Order> findAll();
	
	@Select("select * from tbl_order where id=#{id}")
	public Order fingById(Integer id);
	
	@Select("select * from tbl_order where user_id=#{id}")
	public List<Order> fingByUser(Integer id);
	
	@Select("select * from tbl_order where ordernum=#{num}")
	public Order findByOrdernum(Long num);
	
	@Select("select * from tbl_order where status=#{arg0} and user_id=#{arg1}")
	public List<Order> findByStatus(Integer st,Integer userid);
	
	@Select("select * from tbl_order where ordernum=#{num}")
	public List<Order> findAllByOrdernum(Long num);
	
	@Select("select * from tbl_order order by ordernum")
	public List<Order> findAllByOrder();
	
	@Select("select * from tbl_order order by ordertime")
	public List<Order> findAllByTime();
	
	@Insert("insert into tbl_order(orderuser,orderphone,orderemail,buynum,buymoney,status,ordersite,user_id,product_id,ordertime,ordernum)"
			+ "values(#{orderuser},#{orderphone},#{orderemail},#{buynum},#{buymoney},#{status},#{ordersite},#{user_id},#{product_id},#{ordertime},#{ordernum})")
	public void addOrder(Order order);
	
	@Delete("delete from tbl_order where id=#{id}")
	public void delOrder(Integer id);
	
	@Update("update tbl_order set orderuser=#{orderuser},orderphone=#{orderphone},orderemail=#{orderemail},buynum=#{buynum},buymoney=#{buymoney},status=#{status}"
			+ ",ordersite=#{ordersite},user_id=#{user_id},product_id=#{product_id},ordertime=#{ordertime},ordernum=#{ordernum} where id = #{id}")
	public void updateOrder(Order order);
	
	@Update("update tbl_order set status=#{arg0} where ordernum=#{arg1}")
	public void updateStatus(Integer status,Long nums);
	
	@Update("update tbl_order set status=#{arg0} where id=#{arg1}")
	public void updateStatusById(Integer status,Integer id);
	
//	@Update("update tbl_order set orderuser=#{orderuser},orderphone=#{phone},orderemail=#{email}")
//	public void setUPS(String orderuser,String phone,String email);
}
