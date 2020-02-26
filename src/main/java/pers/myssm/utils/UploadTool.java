package pers.myssm.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/*(1)验证传入的图片非空
	(2)定义图片的存储路径 realPath
	(3)得到原始图片名：xxoo.jpg
	(4)创建新的唯一图片名 = uuidName + .扩展名 9d76abf6-2702-4d18-881d-4e151b5445f3.jpg
	(5)封装上传的文件将要存储的 全路径 = 路径 + 文件名
	C:\java\ide-workspace\project-a\pa-web\target\pa-web\libs\img\9d76abf6-2702-4d18-881d-4e151b5445f3.jpg
	(6)把图片文件转移至 全路径
	(7)返回新图片名 newImageName
*/

public class UploadTool {
	public static String uploadImage(MultipartFile imageFile) throws IllegalStateException, IOException {
		String newImageName = null;
		if (!imageFile.isEmpty()) { // (1)
//			String realPath = "D:\\java\\images\\"; // (2)
			String realPath = "D:\\eclipse\\webshop\\WebShop\\src\\main\\webapp\\images\\";//(2) 
			String originalName = imageFile.getOriginalFilename(); // (3)
			String uuidName = UUID.randomUUID().toString(); // (4)
			newImageName = uuidName + originalName.substring(originalName.lastIndexOf(".")); // (4)
			File file = new File(realPath + newImageName); // (5)
			imageFile.transferTo(file); // (6)
			return newImageName; // (7)
		} else {
			return null;
		}
	}
}
