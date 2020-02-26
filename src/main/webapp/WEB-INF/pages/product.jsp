<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link rel="stylesheet" href="../css/common.css" />
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/common.js" type="text/javascript"></script>
    <script src="../js/custom-pagination.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/custom-pagination.min.css" />
</head>
<style>
    *{margin: 0;padding: 0;}
    html body{width: 100%;font: 14px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;}
    .product_header{
        width: 100%;
        background: #f2f2f2;
    }
    .product_wrapper{
        width: 1200px;
        margin: 0 auto;

    }
    .product_wleft{
        float: left;
        padding: 13px 0 9px;
    }
    .product_item{
        float: left;
    }
    .sep{
        font-family: simsun;
        padding: 0 10px;
    }
    .product_goods{
        position: relative;
        width: 996px;
        margin: 0 auto;
        margin-top: 20px;

    }
    .product_preview{
        float: left;

        border: #E7E7E7 1px solid;
    }
    .product_preview img{
        width: 350px;
        height: 350px;
        vertical-align: bottom;
    }
    .product_info{
        float: right;
        width: 590px;
        margin: 0 20px 0;
        padding-top: 10px;
    }
    .product_name{
        font: 700 16px Arial,"microsoft yahei";
        color: #666;
        line-height: 28px;
        margin-bottom: 10px;
    }
    .product_price{
        position: relative;
        padding-bottom: 2px;
        background: #f3f3f3;
    }
    .pp_txt{
        float: left;
        padding-left: 10px;
        font-family: simsun;
        padding: 2px;
        color: #999;
    }
    .pp_unit{
        font-size: 16px;
        color: #E4393C;
        margin-left: 10px;
        font-family: "microsoft yahei";
    }
    .pp_price{
        font-size: 22px;
        color: #e4393c;
        font-family: "microsoft yahei";
    }
    .product_site{
        height: 38px;
        line-height: 38px;
    }
    .product_1{
        padding: 6px 0;
    }
    .product_describe{
        width: 100%;
        border-top: #bcbcbc 1px solid;
        border-bottom: #bcbcbc 1px solid;
    }
    .product_describe{
        color: #666;
    }
    .product_describe li{
        padding-left: 20px;
        margin-bottom: 5px;
    }
    .product_choose{
        float: right;
        width: 58px;
        height: 44px;
        overflow: hidden;
        border: 1px solid #ccc;
        position: relative;
        margin-right: 140px;
    }
    .product_buynum{
        display: block;
        width: 43px;
        height: 42px;
        line-height: 42px;
        position: absolute;
        top: 1px;
        left: 0;
        border: none;
        border: 0;
        text-align: center;
    }
    .product_cwrapper a{
        display: block;
        width: 15px;
        text-align: center;
        height: 22px;
        line-height: 22px;
        overflow: hidden;
        background: #f1f1f1;
        color: #666;
        position: absolute;
        right: -1px;
        border: 1px solid #ccc;
        margin: 0;
        cursor: pointer;
    }
    .reduce{
        bottom: -1px;
    }
    .product_btn{
        position: absolute;
        right: -2px;
        display: block;
        height: 46px;
        line-height: 46px;
        padding: 0 26px;
        font-size: 18px;
        font-family: "microsoft yahei";
        color: #fff;
        background: #df3033;
    }
    .product_btn:hover{
        color: #fff;
    }
    .product_comment{
        width: 100%;
        padding: 10px 0;
    }
    .product_comheader{
        width: 978px;
        padding: 5px 0 5px 0;
        margin-left: 13%;
        margin-right: 13%;
        margin-top: 10px;
        color: #666;
        font: 700 14px "microsoft yahei";
        background-color: #f7f7f7;
        border: 1px solid #eee;
        text-align: left;
    }
    .product_comheader span{
        margin-left: 6px;
    }
    .product_comments{
        padding: 15px;
        width: 990px;
        margin: 0 auto;
    }
    .comment_user{
        width: 140px;
        float: left;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        font-size: 12px;
    }
    .comment_user img{
        border-radius: 50%;
        margin-right: 10px;
        border: 0;
        vertical-align: middle;
    }
    .comment_info{
        margin-left: 150px;
    }
    .comment_info p{
        font-size: 14px;
        padding: 10px 0;
        line-height: 180%;
        color: #333;
    }
    .comment-item{
        margin-top: 10px;
        border-bottom: 1px solid #ddd;
    }
    .page_wrapper{
        width:100%;
        float: right;
        height: 80px;
        margin-top: 30px;
        text-align: right;
    }
</style>

<body>
<div class="index_header">
    <div class="index_wrapper">
        <ul class="index_wr">
            <li class="index_lr1">
                <a href="${pagecontext.request.contextpath}/WebShop/log" class="index_login">你好，请登录</a>&nbsp;&nbsp;<a href="Jreg.html" class="index_regist">免费注册</a>
            </li>
            <li class="spacer"></li>
            <li class="index_lr2">
                <div class="dt">
                    <a target="_blank" href="${pagecontext.request.contextpath}/myorder">我的订单</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="index_lr3">
                <div class="dt index_icon"><a href="/WebShop">返回首页</a></div>
            </li>
        </ul>
    </div>
</div>
<div class="index_conatiner">
    <div class="index_cheader">
        <div class="cheader_logo">
            <img src="../img/logo.php"/>
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
                <a href="/WebShop/mycart">我的购物车</a>
                <div class="lefticon"></div>
                <div class="righticon"></div>
            </div>
        </div>
    </div>
    <div class="product_header">
        <div class="product_wrapper clearfix">
            <div class="product_wleft">
                <div class="product_item">
                    <a href="/WebShop">首页</a>
                </div>
                <div class="product_item sep">></div>
                <div class="product_item">
                    <a href="#">厨房小电</a>
                </div>
                <div class="product_item sep">></div>
                <div class="product_item">
                    <a href="Jindex.html">电烤箱</a>
                </div>
            </div>
        </div>
    </div>
    <div class="product_goods clearfix">
        <div class="product_preview">
            <img src="../images/${thisproduct.proimg }"/>
        </div>
        <div class="product_info">
            <div class="product_name">
               ${thisproduct.prodesc }
            </div>
            <div class="product_describe">
                <ul>
                    <li>品牌：${thisproduct.probrand }</li>
                </ul>
                <ul>
                    <li>商品名称：${thisproduct.proname }</li>
                    <li>商品编号：1234556</li>
                    <li>商品毛重：9.14kg</li>
                    <li>商品产地：${thisproduct.made }</li>
                    <li>类别：烤箱</li>
                </ul>
            </div>
            <div class="product_price clearfix">
                <div class="product_1 clearfix">
                    <div class="pp_txt">价格</div>
                    <span class="pp_unit">￥</span>
                    <c:if test="${thisproduct.sales >0}">
                    <span class="pp_price">${thisproduct.sales }</span>
                    <span class="pp_price" style="font-size:18"><del>￥${thisproduct.price }</del></span>
                    <input type="hidden" name="buyname" value="${thisproduct.sales}"/>
                   </c:if>
                   <c:if test="${thisproduct.sales <=0}">
                    <span class="pp_price">${thisproduct.price }</span>
                    <input type="hidden" name="buyname" value="${thisproduct.price }"/>
                   </c:if>
                </div>
                
                <div class="product_1 clearfix">
                    <div class="pp_txt" style="float: left">库存</div>
                    <span class="pp_txt">${thisproduct.pronums}</span>
                </div>
                <form id="buypro" action="/WebShop/addcart" method="post">
                	<input type="hidden" name="user_id" value="${sessionScope.user.id}"/>
                	<input type="hidden" name="product_id" value="${thisproduct.id}"/>
                	<input type="hidden" name="buymoney" value="${thisproduct.sales>0?thisproduct.sales:thisproduct.price }"/>
                <div class="product_choose">
                    <div class="product_cwrapper">
                        <input class="product_buynum" id="buy_num" name="num" data-max="200" value="1"/>
                        <a href="javascrip:;" class="add_num" onclick="add('#buy_num')">+</a>
                        <a href="javascrip:;" class="sub_num reduce" onclick="reduce('#buy_num')">-</a>
                    </div>
                </div>
                </form>
                <a href="javascript:void(0);" onclick="document.getElementById('buypro').submit();return false;" class="product_btn">立即抢购</a>
            </div>
        </div>
    </div>
    <div class="product_comment">
        <div class="product_comheader"><span>商品评价</span><span style="color: #e4393c;font-size: 12px">全部评价 (<em>${nums}</em>)</span></div>
        <div class="product_comments clearfix">
            <div class="comment-1">
            <c:if test="${comments == null}">
            	<div class="comment-item">
                  	<h1 align="center">暂无评论</h1>
                </div>
            </c:if>
            <c:forEach items="${comments }" var="bean" varStatus="loop">
            	<div class="comment-item">
                    <div class="comment_user">
                        <img src="../img/user1.jpg" style="height: 25px; width: 25px" alt="西风白水">${username[loop.index]}
                    </div>
                    <div class="comment_info">
                        <p>${bean.comments}</p>
                    </div>
                </div>
            </c:forEach>
            </div>
            <div class="page_wrapper">
                <div id="page" class="page"></div>
            </div>
        </div>

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
<script type="text/javascript">
    // 4.调用插件
    var pro = ${requestScope.thisproduct.id};
    var nums = ${requestScope.total};
    var box = new CustomPagination('#page', {
        total: nums,//总页数
        changePage: function (pageNum) {//切换页码成功回调
            $.ajax({
            	type:"post",
            	url:"getcomments?id="+pro+"&page="+pageNum,
            	data:{'id':pageNum},
            	cotentType:'application/json;charset=UTF-8',
            	success:function(data){
            		$('.comment-1').empty();
            		for(var key in data){
            			$('.comment-1').html("<div class='comment-item'><div class='comment_user'>"
                				+"<img src='../img/user1.jpg' style='height: 25px; width: 25px'>"
                				+data[key].username
    							+"</div><div class='comment_info'><p>"+data[key].comments+"</p></div></div>");
            		}
            		
            		
            	},
            	error:function(data){
            	}
            	
            	
            });
        }
    });

</script>
</body>
</html>
