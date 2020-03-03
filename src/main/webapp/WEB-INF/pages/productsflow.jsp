<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品</title>
    <link rel="stylesheet" href="css/common.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/common.js"></script>
    <link rel="stylesheet" href="css/custom-pagination.min.css" />
    <script type="text/javascript" src="js/custom-pagination.min.js"></script>
</head>
<style>
    *{margin:0;padding: 0}
    body{width: 100%;font: 14px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;}
    .flow_conatiner{
        width: 990px;
        margin: 0 auto;
    }
    .flow_wrapper{

    }
    .flow_header{
        border: 1px solid #eee;
        border-top: 0;
        border-bottom: 0;
        background: #fff;
    }
    .flow_header d1{
        height: 30px;
        overflow: hidden;
        border-bottom: 1px solid #eee;
    }
    .flow_header dt{
        float: left;
        color: #999;
        width: 99px;
        padding: 5px 0 5px 15px;
    }
    .flow_header dd{
        position: relative;
        z-index: 1;
        float: left;
        padding: 0 90px 0 10px;
        width: 769px;
    }
    .flow_header a{
        display: inline-block;
        line-height: 28px;
        margin-right: 35px;
    }
    .flow_sort{
        height: 38px;
        border: 1px solid #eee;
        background: #f8f8f8;
        padding: 0;
    }
    .flow_sort a{
        display: block;
        float: left;
        padding: 0 20px;
        text-decoration: none;
        height: 38px;
        line-height: 38px;
        font-size: 12px;
        color: #333;
    }
    .flow_sort i{
        margin-left: 5px;
        display: inline-block;
        width: 8px;
        height: 8px;
        background: url("img/icon_rank.png") no-repeat 0 0;
    }
    .flow_price i{
        vertical-align: -2px;
        height: 12px;
        background: url("img/icon_pricenormal.png") no-repeat 0 0;
    }
    .flow_mwrapper ul{
        width: 1005px;
    }
    .flow_mwrapper li{
        background: #fff;
        height: 346px;
        width: 231px;
        float: left;
        margin: 10px 10px 0 1px;
        border: 1px solid #fff;
    }
    .flow_img img{
        width: 231px;
        height: 228px;
        border: 0;
    }
    .flow_pr{
        color: #f60;
        font: 20px/1.5 'Tahoma';
    }
    .flow_name{
        margin: 0 auto;
        width: 230px;
        height: 38px;
        font-family: '微软雅黑';
        overflow: hidden;
        font-size: 12px;
        line-height: 18px;
    }
    .flow_name a{
        cursor: pointer;
        display: block;
        margin: 0;
    }
    .flow_addcart{
        position: relative;
        margin-top: 10px;
    }
    .flow_addcart a{
        float: right;
        color: red;
        height: 25px;
        line-height: 25px;
        border: 1px solid #DDD;
        padding: 0 3px 0 26px;
        position: relative;
        background: #fff;
        cursor: pointer;
    }
    .flow_addcart i{
        position: absolute;
        display: block;
        font-style: normal;
        left: 4px;
        top: 3px;
        width: 18px;
        height: 18px;
        background: url("img/search.ele.png") no-repeat 9999px 9999px;
        background-position: 0 -272px;
    }
    .flow_addcart a:hover{
        border: red 1px solid;
    }
    .flow_page{
        padding-top: 30px;
        width: 100%;
        height: 50px;
    }

</style>

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
                <div class="dt index_icon"><a href="Jindex.html">返回首页</a></div>
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
                <a href="cart.html">我的购物车</a>
                <div class="lefticon"></div>
                <div class="righticon"></div>
            </div>
        </div>
    </div>
</div>
<div class="flow_conatiner">
    <div class="flow_wrapper">
        <div class="flow_header">
            <dl class="clearfix">
                <dt>分类</dt>
                <dd>
                    <a href="#none"  style="color: #f60">电视</a>
                    <a href="#none">冰箱洗衣机</a>
                    <a href="#none">空调</a>
                    <a href="#none">厨卫电器</a>
                    <a href="#none">厨房小电</a>
                    <a href="#none">生活电器</a>
                    <a href="#none">个护健康</a>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt>品牌</dt>
                <dd>
                    <a href="#none">小米</a>
                    <a href="#none">创维</a>
                    <a href="#none">SONY</a>
                    <a href="#none">SAMSUNG</a>
                    <a href="#none">华为</a>
                    <a href="#none">Haier</a>
                    <a href="#none">PHILIPS</a>
                </dd>
            </dl>
            <div class="flow_sort">
                <a href="javascript:void(0)" class="flow_more">综合</a>
                <a href="javascript:void(0)" class="flow_num">销量<i></i></a>
                <a href="javascript:void(0)" class="flow_price">价格<i></i></a>
            </div>
        </div>
        <div class="flow_main">
            <div class="flow_mwrapper">
                <ul class="clearfix proflows">
                </ul>
            </div>
        </div>
        <div class="flow_page">
            <div class="order_page">
                <div id="page" class="page"></div>
            </div>
            <script type="text/javascript">
                // 4.调用插件
                var pages = ${requestScope.nums};
                var desc = "${requestScope.desc}";
                var box = new CustomPagination('#page', {
                    total: pages,//总页数
                    changePage: function (pageNum) {//切换页码成功回调
                    	var price ="";
                        $.post("proflows?begin="+pageNum+"&desc="+desc,function(data){
                        	$('.proflows').empty();
                        	for(var i = 0;i < data.length;i++){
                        		if(data[i].sales != 0){
                        			price = data[i].sales+"<del>"+data[i].price+"</del>";
                        		}else{
                        			price = data[i].price;
                        		}
                        		
                        		$('.proflows').append('<li><div class="flow_img">'
                                        +'<a><img src="images/'+data[i].proimg+'"/></a></div>'
                                        +'<p class="flow_pr"><em>￥</em>'+price+'</p>'
                                    	+'<p class="flow_name"><a href="toproduct/'+data[i].id+'">'+data[i].prodesc+'</a></p>'
                                    	+'<div class="flow_addcart clearfix">'
                                        +'<a href="toproduct/'+data[i].id+'"><i></i>立即抢购</a></div></li>');
                        	}
                        });
                    }
                });
            </script>
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
</body>
</html>
