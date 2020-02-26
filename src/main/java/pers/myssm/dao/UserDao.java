package pers.myssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import pers.myssm.domain.User;


/**
 * @Component：将资源交给Spring进行管理，相当于在xml中配置了一个bean。
 * 该注解一般用于即不是表现层又不是业务层更不是持久层的类上面。
 * @Controller：标识该类为表现层
 * @Service：标识该类为业务层
 * @Repository：标识该类为持久层
 */

@Repository
public interface UserDao {
	
	/**
	 * 查找所有管理员
	 * @param user
	 */
	@Select("select * from user where username = #{username}")
	public User getadminByname(String username);

	@Insert("insert into user(username,password,nickname,phonenum,email,address,role)"
			+ "values(#{username},#{password},#{nickname},#{phonenum}," +
			"#{email},#{address},#{role})")
	public void addUesr(User user) throws DuplicateKeyException;

	@Delete("delete from user where id = #{id}")
	public void delUser(Integer id);

	@Update("update  user  set username=#{username},password=#{password},nickname=#{nickname}," +
			"phonenum=#{phonenum},email=#{email},address=#{address} where id = #{id}")
	public void updata(User user);

	@Select("select * from user where id = #{id}")
	public User getUser(Integer id);

	@Select("select * from user")
	public List<User> getAll();
	
	@Select("select * from user where username = #{username}")
	public User getUserByname(String username);
	
	@Select("select username from user where id = #{id}")
	public String getUserNameById(Integer id);
}
