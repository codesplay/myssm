<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>家用电器</title>
    <link rel="stylesheet" href="swiper/swiper-3.4.2.min.css"/>
    <link rel="stylesheet" href="css/common.css"/>
    <script src="swiper/swiper-3.4.2.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/common.js"></script>
</head>
<style>
    *{margin: 0;padding: 0;}
    html body{width: 100%;font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;}
.index_cconatiner {
	width: 100%;
	min-height: 1000px;
	min-width: 1200px;
	font-family: Microsoft YaHei, tahoma, arial, Hiragino Sans GB,
		\\5b8b\4f53, sans-serif;
	overflow: hidden;
	font-size: 14px;
	color: #333;
	background-color: rgb(244, 238, 238);
}

.cconatiner_back {
	min-height: 40px;
	padding: 0px;
	margin: 0px;
	position: relative;
	background-image: none;
	background-position: center center;
	background-repeat: no-repeat;
	background-color: rgb(255, 255, 255);
}

.cconatiner_f1 {
	min-height: 550px;
	padding: 0px;
	margin: -40px 0px 0px;
	position: relative;
	background-image: none;
	background-position: center center;
	background-repeat: no-repeat;
	background-color: rgba(244, 238, 238, 0);
}

.f1_conatiner {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.c_header {
	width: 230px;
	height: 40px;
	line-height: 40px;
	background: rgb(221, 69, 69);
	color: white;
	text-align: center;
}

.c_conatiner {
	width: 100%;
}

.c_conatiner_left {
	width: 230px;
	float: left;
}

.index_tab {
	padding: 6.85714px 10px 0px 20px;
	width: 200px;
	height: 70px;
	background: white;
}

.tab_logo {
	margin-bottom: 7px;
	height: 19px;
	font-size: 14px;
	color: #222;
	font-weight: bold;
}

.tab_logo img {
	vertical-align: bottom;
}

.tab_logo_dre {
	margin-top: -4px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.c_conatiner_right {
	overflow: hidden;
}

.swiper-container {
	height: 370px;
	width: 960px;
	margin-top: 10px;
	margin-left: 8px;
}

.swiper-button-prev {
	width: 40px;
	height: 40px;
	background-size: 40px 40px;
	margin-left: 30px;
	background-image: url("img/banner-btn-left.png");
}

.swiper-button-next {
	width: 40px;
	height: 40px;
	background-size: 40px 40px;
	margin-right: 30px;
	background-image: url("img/banner-btn-right.png");
}

.ccr_buttom {
	margin-top: 8px;
	margin-left: 8px;
}

.ccr_buttom a {
	padding: 0px;
	margin: 10px 10px 20px 0px;
	width: 232px;
	height: 140px;
	float: left;
}

.ccr_buttom>a>img {
	width: 100%;
	height: 100%;
}

.cconatiner_f2 {
	min-height: 526px;
	padding: 40px 0px 0px;
	margin: 0px;
	position: relative;
}

.f2c_wrapper {
	width: 1200px;
	margin: 0 auto;
}

.f2cc_tab_items {
	height: 60px;
	width: 150px;
	float: left;
	line-height: 60px;
	text-align: center;
	background: rgb(255, 255, 255);
	color: rgb(51, 51, 51);
	cursor: pointer;
}

.f2cc_goods_list {
	padding-top: 10px;
	width: 1200px;
}

.f2cct_item {
	padding: 30px 12px 0px;
	margin: 0px;
	float: left;
	height: 304px;
	width: 216px;
	background: white;
}

.f2cct_goodsimg {
	display: block;
	width: 100%;
	height: 180px;
}

.goods_img_wrapper {
	width: 180px;
	height: 180px;
	margin: 0 auto;
}
.goods_img img{
	width:180px;
	heigth:180px
}

.goods_item_title {
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	text-overflow: ellipsis;
	font-size: 14px;
	height: 36px;
	margin: 15px 5px 10px;
	max-width: 100%;
	overflow: hidden;
	white-space: normal;
}

.goods_item_price {
	color: rgb(221, 69, 69);
	margin: 8px 5px;
}

.f2c_left {
	width: 190px;
	float: left;
}

.f2c_left img {
	height: 486px;
	width: 190px;
}

.f2c_center {
	width: 806px;
	float: left;
	overflow: hidden;
}

.f2c_center li {
	position: relative;
	float: left;
	width: 200px;
	background: #ffffff;
	border-left: 1px solid #a7a7a7;
	border-bottom: 1px solid #a7a7a7;
	text-align: center;
}

.f2c_center img {
	margin: 10px 10px 2px;
	width: 120px;
	height: 120px;
	display: inline-block;
}

.f2c_center a {
	margin-top: 0px;
	margin-bottom: 0px;
}

.f2c_right {
	float: right;
	width: 203px;
	height: 486px;
	background: white;
	border-left: 1px solid #a7a7a7;
}

.f2c_right_fire {
	position: relative;
	margin: 18px auto;
	height: 14px;
	line-height: 14px;
	font-weight: bold;
	text-align: center;
	color: #333;
}

.f2c_right_fire i {
	position: absolute;
	top: 5px;
	display: inline-block;
	width: 18px;
	border: solid 1px #000;
}

.f2c_right_fire span {
	padding-left: 20px;
}

.list_img {
	float: left;
}

.list_title {
	width: 96px;
	float: left;
	margin-left: 5px;
}

.list_title_der {
	margin-top: 9px;
	width: 100%;
	height: 32px;
	line-height: 16px;
	text-align: left;
	font-size: 8px;
	overflow: hidden;
}

.f2c_right_list li {
	position: relative;
	overflow: hidden;
	margin-top: 4px;
}

.list_title_price {
	line-height: 14px;
	font-size: 12px;
	margin-top: 6px;
	margin-bottom: 4px;
	font-weight: bold;
	color: #f60;
}
</style>
<script>
    $(function () {

        new Swiper('.swiper-container',{
            loop:'true',
            pagination:'.swiper-pagination',
            paginationClickable:'true',
            prevButton:'.swiper-button-prev',
            nextButton:'.swiper-button-next'
        })
    })
</script>
<body>
<div class="index_header">
    <div class="index_wrapper">
        <ul class="index_wr">
            <li class="index_lr1">
                <c:if test="${sessionScope.user.username == null}">
                	<a href="log" class="index_login">你好，请登录</a>
                	&nbsp;&nbsp;<a href="reg" class="index_regist">免费注册</a>
                </c:if>
                <c:if test="${sessionScope.user.username != null}">
                	<a href="#" class="index_login" style="color:#ccc;font-size:15px">
                	${sessionScope.user.username}
                	<a href="remuser" class="index_login" >退出登录</a>
                	</a>
                </c:if> 
            </li>
            <li class="spacer"></li>
            <li class="index_lr2">
                <div class="dt">
                <!--  target="_blank"在新的标签打开-->
                    <a href="myorders">我的订单</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="index_lr3">
                <div class="dt index_icon"><a href="WebShop">返回首页</a></div>
            </li>
        </ul>
    </div>
</div>
<div class="index_conatiner">
    <div class="index_cheader">
        <div class="cheader_logo">
            <img src="img/logo.php"/>
            <div class="logo_w">家用电器销售市场</div>
        </div>
        <div class="cheader_search">
            <div class="index_form">
                <input type = "text" id="key"/>
                <button>搜索</button>
            </div>
        </div>
        <div class="index_shopping">
            <div class="shopping_icon">
                <a href="mycart">我的购物车</a>
                <div class="lefticon"></div>
                <div class="righticon"></div>
            </div>
        </div>
    </div>
    <div class="index_cconatiner">
        <div class="cconatiner_back"></div>
        <div class="cconatiner_f1">
            <div class="f1_conatiner">
                <div class="c_header">家用电器</div>
                <div class="c_conatiner">
                    <div class="c_conatiner_left">
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/tv.png"/>
                                <a class="tab_logo_dre" href="#">电视</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">平板电视</a>
                                <a href="#">家庭影音</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/ice.png"/>
                                <a class="tab_logo_dre" href="#">冰箱洗衣机</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">对开门冰箱</a>
                                <a href="#">洗烘一体机</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/aircdt.png"/>
                                <a class="tab_logo_dre" href="#">空调</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">壁挂式空调</a>
                                <a href="#">立柜式空调</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/kitchen.png"/>
                                <a class="tab_logo_dre" href="#">厨卫电器</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">烟灶</a>
                                <a href="#">热水器</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/kitchen1.png"/>
                                <a class="tab_logo_dre" href="#">厨房小电</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">电饭煲</a>
                                <a href="#">电烤箱</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/elect.png"/>
                                <a class="tab_logo_dre" href="#">生活电器</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">吸尘器</a>
                                <a href="#">净化除醛</a>
                            </div>
                        </div>
                        <div class="index_tab">
                            <div class="tab_logo">
                                <img src="img/elect1.png"/>
                                <a class="tab_logo_dre" href="#">个护健康</a>
                            </div>
                            <div class="tab_item">
                                <a href="#">电动剃须刀</a>
                                <a href="#">电吹风机</a>
                            </div>
                        </div>

                    </div>
                    <div class="c_conatiner_right">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><a href="#"><img src="img/ariact.jpg" /></a></div>
                                <div class="swiper-slide"><a href="#"><img src="img/eleact.jpg"/></a></div>
                                <div class="swiper-slide"><a href="#"><img src="img/spract.jpg"/></a></div>
                                <div class="swiper-slide"><a href="#"><img src="img/sprbuy.jpg"/></a></div>
                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination" style="margin-bottom: 20px"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                        <div class="ccr_buttom">
                            <a href="#"><img src="img/bot1.jpg"/></a>
                            <a href="#"><img src="img/bot2.jpg"/></a>
                            <a href="#"><img src="img/bot3.jpg"/></a>
                            <a href="#" style="margin-right: 0"><img src="img/bot4.jpg"/></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="cconatiner_f2">
            <div class="f2_conatiner">
                <div class="f2c_wrapper">
                    <div class="f2c_header" style="background-image:url('img/text1.png'); height: 62px;line-height: 62px;margin: 0px 0px 20px; padding: 0px; text-align: center;"></div>
                    <div class="f2c_conatiner">
                        <div class="f2cc_tab" style="width: 1200px">
                            <ul class="f2cc_tab_item" style="height: 60px">
                                <li class="f2cc_tab_items" id="list0" list ="0" style="background-color: rgb(221, 69, 69);color: white">平板电视</li>
                                <li class="f2cc_tab_items" id="list1" list="1">冰箱洗衣机</li>
                                <li class="f2cc_tab_items" id="list2" list="2">空调</li>
                                <li class="f2cc_tab_items" id="list3" list="3">厨卫大电</li>
                                <li class="f2cc_tab_items" id="list4" list="4">厨房小电</li>
                                <li class="f2cc_tab_items" id="list5" list="5">生活电器</li>
                                <li class="f2cc_tab_items" id="list6" list="6">个护健康</li>
                                <li class="f2cc_tab_items" id="list7" list="7">店铺热销</li>
                            </ul>
                            <!-- 分类促销 -->
                            <diV class="f2cc_goods_list" id="tv_list">
                            	<c:forEach begin="0" end="4" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV> 
                            <diV style="display: none" class="f2cc_goods_list" >
                            	<c:forEach begin="5" end="9" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <diV style="display: none" class="f2cc_goods_list">
                                <c:forEach begin="10" end="14" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <diV style="display: none" class="f2cc_goods_list" >
                                <c:forEach begin="15" end="19" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <diV style="display: none" class="f2cc_goods_list" >
                                <c:forEach begin="20" end="24" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <diV style="display: none" class="f2cc_goods_list" >
                                <c:forEach begin="25" end="29" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <diV style="display: none" class="f2cc_goods_list" >
                                <c:forEach begin="30" end="34" items="${firepro}" var="bean">
                            		<div class="f2cct_item">
                                   		 <a href="toproduct/${bean.id}" class="f2cct_goodsimg">
                                     	 	<div class="goods_img_wrapper">
                                        	   <div class="goods_img">
                                         	       <img src="${pageContext.request.contextPath}/images/${bean.proimg }"/>
                                           		</div>
                                        	</div>
                                    	  </a>
                                    	<a class="goods_item_title" href="toproduct/${bean.id}" >${bean.prodesc }</a>
                                    	<c:if test="${bean.sales <=0 }">
                                    	<p class="goods_item_price" >￥ ${bean.price}</p>
                                    	</c:if>
                                    	<p class="goods_item_price" ></p>
                                    	<c:if test="${bean.sales>0 }">
                                    		<p class="goods_item_price" ><del>原价:￥ ${bean.price}</del></p>
                                    		<p class="goods_item_price" >特价：￥ ${bean.sales}</p>
                                    	</c:if>
                                	</div>
                            	</c:forEach>
                            </diV>
                            <!-- del 店铺热销 --><diV style="display: none" class="f2cc_goods_list" >
                                <div class="f2cct_item">
                                    <a href="#" class="f2cct_goodsimg">
                                        <div class="goods_img_wrapper">
                                            <div class="goods_img">
                                                <img src="img/konka.jpg"/>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="goods_item_title" href="#" >康佳（KONKA）55A10 55英寸 4K超高清 超薄金属机身 3GB+64GB大内存 全景AI智慧屏 全面屏 智能电视</a>
                                    <p class="goods_item_price" >￥ 9200.00</p>
                                </div>
                                <div class="f2cct_item">
                                    <a href="#" class="f2cct_goodsimg">
                                        <div class="goods_img_wrapper">
                                            <div class="goods_img">
                                                <img src="img/konka.jpg"/>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="goods_item_title" href="#" >康佳（KONKA）55A10 55英寸 4K超高清 超薄金属机身 3GB+64GB大内存 全景AI智慧屏 全面屏 智能电视</a>
                                    <p class="goods_item_price" >￥ 9200.00</p>
                                </div>
                                <div class="f2cct_item">
                                    <a href="#" class="f2cct_goodsimg">
                                        <div class="goods_img_wrapper">
                                            <div class="goods_img">
                                                <img src="img/konka.jpg"/>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="goods_item_title" href="#" >康佳（KONKA）55A10 55英寸 4K超高清 超薄金属机身 3GB+64GB大内存 全景AI智慧屏 全面屏 智能电视</a>
                                    <p class="goods_item_price" >￥ 9200.00</p>
                                </div>
                                <div class="f2cct_item">
                                    <a href="#" class="f2cct_goodsimg">
                                        <div class="goods_img_wrapper">
                                            <div class="goods_img">
                                                <img src="img/konka.jpg"/>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="goods_item_title" href="#" >康佳（KONKA）55A10 55英寸 4K超高清 超薄金属机身 3GB+64GB大内存 全景AI智慧屏 全面屏 智能电视</a>
                                    <p class="goods_item_price" >￥ 9200.00</p>
                                </div>
                                <div class="f2cct_item">
                                    <a href="#" class="f2cct_goodsimg">
                                        <div class="goods_img_wrapper">
                                            <div class="goods_img">
                                                <img src="img/konka.jpg"/>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="goods_item_title" href="#" >康佳（KONKA）55A10 55英寸 4K超高清 超薄金属机身 3GB+64GB大内存 全景AI智慧屏 全面屏 智能电视</a>
                                    <p class="goods_item_price" >￥ 9200.00</p>
                                </div>
                            </diV>
                        </div>

                    </div>
                </div>
            </div>
        </div>
       	<c:forEach begin="0" end="6" var="i">
        <div class="cconatiner_f2">
                <div class="f2_conatiner">
                    <div class="f2c_wrapper">
                        <div class="f2c_header" style="background-image:url('img/${i}.png'); height: 62px;line-height: 62px;margin: 0px 0px 20px; padding: 0px; text-align: center;"></div>
                        <div class="f2c_conatiner">
                            <div class="f2c_left">
                                <a><img src="img/arititleimg.png"/></a>
                            </div>
                            <div class="f2c_center">
                                <ul>
                                	<c:forEach begin="${i*8+0}" end="${i*8+7}" items="${indexpro}" var="bean">
                                		<li>
                                        	<a href="toproduct/${bean.id }" ><div><img src="images/${bean.proimg }"/></div></a>
                                        	<a class="goods_item_title" href="toproduct/${bean.id }" >${bean.prodesc }</a>
                                        	<p class="goods_item_price" >
                                        		<c:if test="${bean.sales>0 }">
                                        			特价:￥ ${bean.sales }<del style="margin-left:10px">￥ ${bean.price }</del> 
                                        		</c:if>
                                        		<c:if test="${bean.sales<=0 }">
                                        			￥ ${bean.price }
                                        		</c:if>
                                        	</p>
                                    	</li>
                                	</c:forEach>
                                </ul>
                            </div>
                            <div class="f2c_right"><div class="f2c_right_fire"><i></i><span>热销排行榜</span><i></i></div>
                                <ul class="f2c_right_list"> 
                                	<c:forEach begin="${i*6+0}" end="${i*6+5 }" items="${firelist }" var="bean">
                                		<li>
                                        <div class="list_img">
                                            <a href="toproduct/${bean.id }"><img style="width: 65px;height: 65px; vertical-align: bottom;" src="images/${bean.proimg }"/></a>
                                        </div>
                                        <div class="list_title">
                                            <p class="list_title_der">${bean.prodesc }</p>
                                            <div class="list_title_price"><i>￥</i><em>${bean.price }</em></div>
                                        </div>
                                    	</li>
                                	</c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    	</c:forEach>
    </div>

</div>
<div class="index_footer">
    <div class="footer-2019">
        <p>
            <a href="#">关于我们</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">联系客服</a><span>|</span>
            <a href="#">合作招商</a><span>|</span>
            <a href="#">营销中心</a><span>|</span>
            <a href="#">友情链接</a><span>|</span>
            <a href="#">隐私政策</a><span>|</span>
        </p>
    </div>
    <div class="copyright">
        <p><a href="#">京公网安备 1xxxxxxxxxxxx8号</a><span>|</span><span>京ICP证xxxxxx号</span><span>|</span><span>xxxxxxx xxxxxxxxx号</span></p>
        <p><span>网络文化经营许可证京网文[xxxx]xxxx-xxx号</span><span></span><span>|</span><span>违法和不良信息举报电话：4006561155</span></p>
    </div>
</div>
</body>
</html>
