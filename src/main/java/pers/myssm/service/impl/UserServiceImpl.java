package pers.myssm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import pers.myssm.dao.UserDao;
import pers.myssm.domain.User;
import pers.myssm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	/**
	 * 根据username与password匹配用户
	 */
	public Integer findUser(String username,String password){
		User user;
		if((user = userDao.getUserByname(username)) != null){
			if(user.getPassword().equals(password)){
				return user.getId();
			}else {
				return -2;
			}
		}else{
			return -1;
		}
	}
	
	/**
	 * 查找管理员
	 * 
	 */
	public Integer findadmin(String username,String password) {
		User user = userDao.getadminByname(username);
		if(user!= null && user.getRole()==1){
			if(user.getPassword().equals(password)){
				return user.getId();
			}else {
				return -2;
			}
		}else{
			return -1;
		}
	}
	
	public User getUser(Integer id) {
		return userDao.getUser(id);
	}

	public List<User> getAll() {
		return userDao.getAll();
	}

	public void saveUser(User user) throws DuplicateKeyException {
		userDao.addUesr(user);
	}

	public void delUser(Integer id) {
		userDao.delUser(id);
	}

	public void updata(User user) {
		userDao.updata(user);
	}

	@Override
	public String getUserNameById(Integer id) {
		return userDao.getUserNameById(id);
	}
	

	

}
