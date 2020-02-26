package pers.myssm.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

import pers.myssm.domain.Order;
import pers.myssm.service.impl.OrderServiceImpl;

@Controller
@RequestMapping("/alipay")
public class AlipayController {
	// 商户appid
	public static String APP_ID = "2016092900626199";
	// 私钥 pkcs8格式的
	public static String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCPpyOE1lTxSLs/022k4uHqEeBMi07engMJWC6M9rJYI/5o4oPWdp1AQUgQz8Lqb4GHGXklBojOdYe8cuW8BUBc6mDM8He/E0fQT/gzvBdMmK9ziWO8IBldY3z7BH33KryG3g7MnnfdWZ8ezPtwSlLngd9/POCFFoRnJXjr/YHxSXsFRwTeH2SxD+l2dEOgeDpCLjAi4VsTASuJfTQm/o7Cqp21h3SRiTD0df2H8Llnt/5URf288O3WYYVLyWx2uTun30bAaZzIosQJx9L+SEQOvlOzgIZeyy2GgJKoWP5XMhsqhgMtCbuQvcrwJ6siAc1mjpwSmQDAAYIb5jbGijLDAgMBAAECggEAeFiVsRu+XcWI2ZfPK2vHx8jiGD48/NNzx8hQd1fVYXIGGOhreqg0ZThLn4nuyWhRI1V74EDxK8XayU2YmUPs/+p63jY2m6UTbLkSPoU9H7Zqhmh7XYemuE44zjKdNQxglLxDubiowo/qdmtT2mbpvXlYO8hMcDLFCYSjIVFoIzMiNtSdz1/uGQ87lL+YbzvZEQF/GiHNoZKuNox6HG1JF0gy7tcUcBzJ7lMg4PCn34uwma0WVUunttIFoipy7sMqVpbBsZ6AtYs0YILFl+3RalLmMnryAczNeZkfCr5XnhpimRUNZ2oNMhgLBXAFVUkrMGdwWsOLaZ5BOdl4TvV3QQKBgQDLWT6xwsXYzosCNesUFtxXtPsKKvgvWZn+SfCXgyQUSu41lgG8gPY8ZwKLbjisfR61d+i562GrCvyvY6xf1i6sR308RLc4DbsDr13rs/ngSnwXnvgy0WJ6U++lwMn1Y0/jZC+mWlUeRJLqBwPaH2+C6Ua5hIvh8tXfhXHdxm8iBQKBgQC02QYHEV0QhjXgjnssaOAlL8jzVVjHJMric/uLGqlTnZdIDGCWuJL7qaCVjiEzEyqJLkoEbqoFH6ZafnAiG2vRiodNxfaR2JQ5dCfZ9ga6MYgsKil8MFjswtrRD0J7OUFLyhs/L1Pex5LZ6Obj5at3nehHHACiAQMAI6pQFVc0JwKBgQCA9wzH+Fs58WQ/9qosh4MfLOy5uh7FCPKdT4+Cx+0t4YfJ/GUFhFSmYj4+55yR6Jh9RpsWrq22qLUxFunPrirToFNQ0dPRfQPKhoHuZqpnEVY6NNv8fscSBgHLAcYUFvQnpvaBbnDlTWBPhDtxLtauE/yC1AlTN4tkw2E/4gXBcQKBgCfMx0XQ7XFQiBTmZncskX+9l3Tt6H7TOw9BRS+k63Tqbru9dZhWAIsAFsYzJF1QL4FHPaTiEerUv1CVGOp4rG7OFN7p3UzVpDFMveR6/5oEgpptoPmizj801uFBgXkK7bLXRM3QBZ42v7vTRNUM24KUruTPZdhBbr6eGsJLIAjrAoGAKAEuV0qfxuYPJgUF8sd1UlPCJ38ekXeKp41ANguM8qiKC2qTtMufxIiypbA8+YuhsgIcU8Y/NrNKBKFTdVwteXXZAJx+Vb1UFlTYmRpw8un9P6Uk8gOVc+m33Qb9DclPLdu9MV8tRJ+isNp33qgFkA4URlR91tNxE397C5Q82G8=";
	// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/WebShop/alipay/notify_url";
	// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	// 商户可以自定义同步跳转地址
	public static String return_url = "http://localhost:8080/WebShop/alipay/return_url";
	// 请求网关地址s
	public static String URL = "https://openapi.alipaydev.com/gateway.do";
	// 编码
	public static String CHARSET = "UTF-8";
	// 返回格式
	public static String FORMAT = "json";
	// 支付宝公钥
	public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApiRZZ5ztLlHvWlBCBUgvLfnF+Hb3TH8fFUy1O4UBOjeSRaXnLAlEPayoQ2q6UCiEFOyNHbvrvS3G9LO2GgE8M9nYOXA6gr4+uQCRstMKZygv309Eb/2caGb4EG/f8YeFk+NYu1uC/FKHqxQbLIMPecIjHyKz2h/ppgHcmTJlVPncRlcMRAvkK5SBvIiwuPCRUAYOzVvWI1z/CAF9KnCDbw8sj2rVkRBWaHkhjSXPPiJf77RFHsiWO6YTG5XP38md6obSiTXomVD5iCrbQIIfbrVfziyr0+EDZTwrsFcb1rSINgPVYXkB5XCzLPye74b3Bp4ryuLtpuNTwokefhdERwIDAQAB";
	// 日志记录目录
	public static String log_path = "/log";
	// RSA2
	public static String SIGN_TYPE = "RSA2";
	
	@Autowired
	private OrderServiceImpl orderService;

	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public void pay(@RequestParam("WIDout_trade_no") Long num, HttpServletResponse httpResponse)
			throws ServletException, IOException {
		AlipayClient alipayClient = new DefaultAlipayClient(URL,APP_ID,APP_PRIVATE_KEY,FORMAT,CHARSET,ALIPAY_PUBLIC_KEY,SIGN_TYPE); // 获得初始化的AlipayClient
//		Long widout_trade_no = (Long) httpRequest.getAttribute("WIDout_trade_no");
		Long widout_trade_no = num;
		List<Order> list = orderService.getAllByNUM(widout_trade_no);
		double buymoney = 0.0;
		for(Order order : list){
			buymoney+=order.getBuymoney();
		}
		System.out.println(widout_trade_no+" "+buymoney);
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();// 创建API对应的request
		alipayRequest.setReturnUrl(return_url);
		alipayRequest.setNotifyUrl(notify_url);// 在公共参数中设置回跳和通知地址
		alipayRequest.setBizContent("{" +
		        "\"out_trade_no\":\""+widout_trade_no+"\"," +
		        "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
		        "\"total_amount\":"+new DecimalFormat("0.00").format(buymoney) +","+
		        "\"subject\":\"家用电器销售市场\"" +
				"}");//填充业务参数
		String form = "";
		try {
			form = alipayClient.pageExecute(alipayRequest).getBody(); // 调用SDK生成表单
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}
		httpResponse.setContentType("text/html;charset=" + CHARSET);
		httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
		httpResponse.getWriter().flush();
		httpResponse.getWriter().close();
	}

	//同步回调
	@RequestMapping(value = "/return_url", method = RequestMethod.GET)
	public String returnUrl(HttpServletRequest request)
			throws IOException, AlipayApiException {
		System.out.println("=================================同步回调=====================================");

		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		System.out.println(params);
		boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE);

		// ——请在这里编写您的程序（以下代码仅作参考）——
		if (signVerified) {
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

			System.out.println("商户订单号=" + out_trade_no);
			System.out.println("支付宝交易号=" + trade_no);
			System.out.println("付款金额=" + total_amount);
			System.out.println("success支付");
			orderService.updateStatus(1,Long.valueOf(out_trade_no));
			return "redirect:/myorders";
		} else {
			return "redirect:/myorders?error=1";
		}
		
	}
	
	//异步回调
	@RequestMapping(value = "/notify_url", method = RequestMethod.POST)
	public String notifyUrl(HttpServletRequest request)
			throws AlipayApiException, IOException {
		System.out.println("#################################异步回调######################################");
		
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
 
		System.out.println(params);
		boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
 
		// ——请在这里编写您的程序（以下代码仅作参考）——
 
		/*
		 * 实际验证过程建议商户务必添加以下校验： 1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		 * 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）， 3、校验通知中的seller_id（或者seller_email)
		 * 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		 * 4、验证app_id是否为该商户本身。
		 */
		if (signVerified) {// 验证成功
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
 
			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
 
			// 交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
 
			System.out.println("商户订单号="+out_trade_no);
			System.out.println("支付宝交易号="+trade_no);
			System.out.println("交易状态="+trade_status);
			if (trade_status.equals("TRADE_FINISHED")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序
				System.out.println("no option");
				// 注意：
				// 退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			} else if (trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序
				orderService.updateStatus(1,Long.valueOf(out_trade_no));
				// 注意：
				// 付款完成后，支付宝系统发送该交易状态通知
			}
 
			return "redirect:/myorders";
 
		} else {// 验证失败
			System.out.println("异步回调验证失败");
			return "redirect:/myorders?error=2";
 
			// 调试用，写文本函数记录程序运行情况是否正常
			// String sWord = AlipaySignature.getSignCheckContentV1(params);
			// AlipayConfig.logResult(sWord);
		}
	}
}
