package pers.myssm.controller;

/**
 * 
 * 1. webapp下面创建目录 "/libs/image"用来保存图片
 * String realPath = ;
 * <img src="${pageContext.request.contextPath}/libs/image/${imageName}" />
 * request.getSession().getServletContext().getRealPath("/libs/image")
 * 2..把图片保存在电脑上
	2-1. 配置图片存放的物理路径与虚拟路径，
	打开tomcat\conf\server.xml文件在Host标签下加上如下配置
	C:\java\images 是图片存放的物理路径，/images 是访问图片的虚拟路径
	<Host><Context docBase="C:\java\images" path="/images"/></Host>
 * 
 * 
 */



import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pers.myssm.domain.Comment;
import pers.myssm.domain.Product;
import pers.myssm.service.impl.CateServiceImpl;
import pers.myssm.service.impl.CommentServiceImpl;
import pers.myssm.service.impl.ProductServiceImpl;
import pers.myssm.service.impl.UserServiceImpl;
import pers.myssm.utils.Page;
import pers.myssm.utils.UploadTool;


@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImpl productSerivce;
	
	@Autowired
	private CateServiceImpl cateService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@Autowired
	private UserServiceImpl userService;
	
	
	/**
	 * 商品瀑布流
	 * @param map
	 * @return
	 */
	@RequestMapping("/toproflow")
	public String getproflow(@RequestParam("desc") String desc,Map<String, Object> map){
		map.put("nums", Page.getPages(productSerivce.getNums(desc), 16));
		System.out.println("获取nums"+productSerivce.getNums(desc));
		map.put("desc", desc);
		System.out.println("获取搜索商品名称");
		return "productsflow";
	}
	
	@RequestMapping("/proflows")
	@ResponseBody
	public List<Product> getProducts(@RequestParam("desc") String desc,@RequestParam(value="begin",required=false) Integer begin){
		System.out.println("desc"+desc+"begin:"+begin);
		return productSerivce.getAsPage(desc, (begin-1)*16, 16);
	}
	
	@RequestMapping("/products")
	public String getList(Map<String, Object> map){
		map.put("products", productSerivce.getAll());
		map.put("cate", cateService.findAll());
		return "Product/list";
	}
	
	/**
	 * 修改
	 * 
	 */
	@RequestMapping("/editproduct")
	public String editPage(@RequestParam("i") Integer id,ModelMap modelMap) {
		modelMap.addAttribute("product", productSerivce.getProducById(id));
		modelMap.addAttribute("cate",cateService.findAll());
		System.out.println("editepage:"+productSerivce.getProducById(id).toString());
		return "Product/add";
	}
	
	
	@ModelAttribute("editproduct")
	public void getProduct(@RequestParam(value="id",required=false) Integer id,Map<String, Object> map) {
		if(id != null){
			map.put("editproduct", productSerivce.getProducById(id));
			System.out.println("productControllermodelattr"+productSerivce.getProducById(id).toString());
		}
	}
	
	@RequestMapping("/updateproduct")
	public String updateProduct(@RequestParam("product.proimg") MultipartFile file,@ModelAttribute("editproduct") Product editproduct){
		String imageName = null;
		System.out.println("product edit");
		if(!file.getOriginalFilename().equals(editproduct.getProimg())){
			try {
				System.out.println("修改图片");
				imageName = UploadTool.uploadImage(file);
			} catch (IllegalStateException | IOException e) {
				System.out.println("获取image失败");
				System.out.println(e);
			}
			editproduct.setProimg(imageName);
		}
		System.out.println("xiugai"+editproduct.toString());
		productSerivce.updata(editproduct);
		return "redirect:products";
	}
	
	/**
	 * 添加
	 * 先回显商品种类到page
	 * 存入数据库
	 */
	@RequestMapping(value="/addproduct",method=RequestMethod.GET)
	public String getPage(Map<String, Object> map){
		map.put("cate", cateService.findAll());
		map.put("product", new Product());
		return "Product/add";
	}
	@RequestMapping(value="/addproduct",method=RequestMethod.POST)
	public String addProduct(Product product,@RequestParam("product.proimg") MultipartFile file) {
		String imageName = null;
		try {
			imageName = UploadTool.uploadImage(file);
		} catch (IllegalStateException | IOException e) {
			System.out.println("获取image失败");
			System.out.println(e);
		}
		System.out.println("product add");
		product.setProimg(imageName);
		productSerivce.saveProduct(product);
		return "redirect:/products";
	}
	
	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/delproduct/{id}")
	public String delProduct(@PathVariable("id")Integer id){
		productSerivce.delProduct(id);
		return "redirect:/products";
	}
	
	/**
	 * index  页面: / map<products,list> map<rank,list> <sales,list>
	 * product页面: toproduct productid
	 * productsflow 页面: toflow 
	 * 
	 */
	@RequestMapping("/")
	public String index(Map<String,Object> map){
		
//		5个一组
		map.put("firepro", productSerivce.getAllByCate(5));
//		8个一组
		map.put("indexpro", productSerivce.getAllByCate(8));
//		热销
		map.put("firelist", productSerivce.getAllFireRang(6));
		System.out.println("index");
		return "index";
	}
	
	@RequestMapping("/toproduct/{id}")
	public String getproPage(@PathVariable("id") Integer id,Map<String, Object> map){
		map.put("thisproduct", productSerivce.getProducById(id));
		Long nums = commentService.getNums(id);
		Long pages = Page.getPages(nums, 6);
		List<Comment> commentList = commentService.getCommentsPage(id, 0, 6);
		System.out.println(commentList);
		List<String> username = new ArrayList<String>();
		for(Comment co : commentList){
			username.add(userService.getUserNameById(co.getUser_id()));
		}
		map.put("pages", pages);
		map.put("total", commentList.size()/1);
		map.put("nums", commentList.size());
		map.put("comments",commentList);
		map.put("username", username);
		return "product";
	}
	
	@RequestMapping("/searchpro")
	public String getflow(@RequestParam("proname") String proname,Map<String,Object> map){
		map.put("flows", productSerivce.getProductByName(proname));
		return "productsflow";
	}
}
