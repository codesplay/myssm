package pers.myssm.controller;

import java.util.Map;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import pers.myssm.domain.User;
import pers.myssm.service.impl.UserServiceImpl;

@SessionAttributes(value = { "user" ,"admin"})
@Controller
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	/**
	 * 用户登录 1、表单post 获取请求username 与 password 2、判断username是否存在。false:回显用户不存在
	 * 3、password是否匹配。false:回显密码错误 
	 * 4、存在重定向到index
	 */
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "username", defaultValue = "false") String username,
			@RequestParam(value = "password", defaultValue = "false") String password
			,Map<String, Object> map) {
		System.out.println(password+""+username);
		Integer errors = userService.findUser(username, password);
		System.out.println("finduer"+errors);
		if(errors < 0){
			System.out.println("posts");
			map.put("errors", errors);
			return "Jlogin";
		}else{
			//存入session中
			map.put("user", userService.getUser(errors));
			System.out.println("sesions");
			return "redirect:/";
		}
	}
	/**
	 * 管理员登录
	 */
	@RequestMapping("/admin")
	public String adminlog(@RequestParam(value = "username", defaultValue = "false") String username,
			@RequestParam(value = "password", defaultValue = "false") String password
			,Map<String, Object> map) {
		System.out.println(password+"admin"+username);
		Integer errors = userService.findadmin(username, password);
		System.out.println("findadmin"+errors);
		if(errors < 0){
			System.out.println("postsadmin");
			map.put("errors", errors);
			return "adminlog";
		}else{
			//存入session中
			map.put("admin", userService.getUser(errors));
			System.out.println("sesions");
			return "main";
		}
	}
	
/*	@RequestMapping(value="/logina",method=RequestMethod.GET)
	public String loginagin(@RequestParam("errors") Integer id,Map<String, Object> map){
		map.put("errors", id);
		System.out.println("回显"+id);
		return "Jlogin";
	}*/
	

	/**
	 * 用户注册
	 *  1、添加用户 username password phone
	 * 隐藏input nickname email address role id
	 * 2、管理员添加 modelattribute回显
	 *
	 */

	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(User user,
			Map<String, Object> map) {
		try {
			userService.saveUser(user);
		} catch (DuplicateKeyException e) {
			System.out.println("username重复");
			map.put("errors", 1);
			return "Jreg";
		}
		map.put("user", user);
		return "redirect:/";
	}
	/**
	 * 添加用户
	 * @param user
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	public String addUser(User user,
			Map<String, Object> map) {
		try {
			userService.saveUser(user);
		} catch (DuplicateKeyException e) {
			System.out.println("username重复");
			map.put("errors", 1);
			return "User/add";
		}
		return "redirect:/userlist";
	}

	/**
	 * 退出登录
	 * 1、user
	 * 2、admin
	 */
    @RequestMapping("/remuser")
    public String remuser(HttpSession session,SessionStatus sessionStatus){
    	session.removeAttribute("user");
        sessionStatus.setComplete();
        System.out.println("退出登录");
        return "redirect:/";
    }
    //退出登录
    @RequestMapping(value="/remadmin",method=RequestMethod.GET)
    public String remadmin(HttpSession session,SessionStatus sessionStatus){
    	session.removeAttribute("admin");
        sessionStatus.setComplete();
        System.out.println("退出登录");
        return "redirect:/adlog";
    }
    
    /*
     * 用户list
     */
    @RequestMapping(value="/userlist",method=RequestMethod.GET)
    public String getlist(Model model){
    	model.addAttribute("userlist", userService.getAll());
    	return "User/list";
    }
    
    /**
     * 用户删除
     */
    @RequestMapping("/deluser")
    public String deluser(@RequestParam("id") Integer id){
    	userService.delUser(id);
    	return "redirect:/userlist";
    }
    
    /**
     * 1、用户修改页面 edituser/${id} 回显 add.jsp 
     * jsp判断是否存在user modelattribute=edituser
     * 2、修改操作  put 请求 add.jsp中 配置 name= _method method = put
     * 然后 modelattribute标签定义获取
    */
    @RequestMapping(value="/editpage",method=RequestMethod.GET)
    public String getedit(@RequestParam("id") Integer id,ModelMap md) {
    	md.addAttribute("edituser", userService.getUser(id));
		return "User/add";
	}
    
    //修改 先数据库查找
    @ModelAttribute("edituser")
    public void getUser(@RequestParam(value = "id", required = false) Integer id,
    		Map<String, Object> map){
    	if(id != null){
    		System.out.println("获取user");
			map.put("edituser", userService.getUser(id));
    	}
    }
    
    @RequestMapping(value="/adduser",method=RequestMethod.PUT)
    public String editUser(@ModelAttribute("edituser") User user){
    	System.out.println("修改");
    	userService.updata(user);
    	return "redirect:/userlist";
    }

}
