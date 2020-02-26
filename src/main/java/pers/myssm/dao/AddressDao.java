package pers.myssm.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import pers.myssm.domain.Address;

@Repository
public interface AddressDao {
	
	@Select("select * from tbl_address where user_id = #{user_id} and product_id = #{product_id}")
	public Address findById(Integer user_id,Integer product_id);
	
	@Insert("insert into tbl_address(user_id,product_id,site,name,phone,email) values(#{user_id},#{product_id},#{site},"
			+ "#{name},#{phone},#{email})")
	public void add(Address address);
	
	@Update("update tbl_address set user_id=#{user_id},product_id=#{product_id},site=#{site},name=#{name}"
			+ ",phone=#{phone},email=#{email} where id=#{id}")
	public void update(Address address);
	
	@Delete("delete from tbl_address where id=#{id}")
	public void delete(Integer id);
	
	
}
