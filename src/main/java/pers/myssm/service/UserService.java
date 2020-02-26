package pers.myssm.service;

import pers.myssm.domain.User;

import java.util.List;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public interface UserService {
	//查
	public Integer findUser(String username,String password);
	public Integer findadmin(String username,String password);
	public User getUser(Integer id);
	public List<User> getAll();
	public String getUserNameById(Integer id);
	//增
	public void saveUser(User user) throws MySQLIntegrityConstraintViolationException;
	//删
	public void delUser(Integer id);
	//改
	public void updata(User user);
	
	
}
