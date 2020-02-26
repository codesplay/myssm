<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="js/html5shiv.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/distpicker.data.js"></script>
    <script src="js/distpicker.js"></script>
    <script src="js/common.js"></script>
    <!--    <script src="js/main.js"></script>-->
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<style>
    body{
        background: white;
        font-size: 12px;
        color: #666;
    }
    a{text-decoration: none;}
    .form .item{
        display:inline-block;
        display:block;
        margin-bottom:15px;
        line-height:25px;
    }
    .form .item:after{
        content:".";
        display:block;
        height:0;
        clear:both;
        visibility:hidden;
    }
    * html .form .item {
        height:1%;
    }
    *html .form .item{min-height:1%}
    .form .item span.label{
        float:left;
        height:18px;
        line-height:18px;
        padding:4px 0 3px;
        width:75px;
        text-align:right;
    }
    .fl{
        float: left;
    }
    .form .label em{color:#e4393c}
    .form .area,.form .itxt,.form .selt{
        line-height:18px;
        border:1px solid #ccc;
        padding:5px;
        vertical-align:middle;
        float:none;
        outline:0;
    }
    .form .itxt{
        height:18px;
        width:155px;
        padding:3px 5px 2px
    }
    .form .itxt01{width:510px;}
    .form .itxt02{width:245px;}
    .form .itxt03{width:185px;}
    .form .itxt04{width:225px;}
    .form .itxt05{
        width:270px;
        line-height:22px;
        height:22px;
    }
    .form .itxt06{width:420px;}
    .form label{float:none;}
    .form .jdcheckbox,.form .jdradio{
        float:none;
        vertical-align:-2px;
        vertical-align:-1px;
        margin:0 3px 0 0;
        padding:0;
    }
    .form .error-msg{
        display:inline-block;
        *display:inline;
        *zoom:1;
        height:28px;
        line-height:28px;
        padding:0 10px 0 30px;
        vertical-align:middle;
        color:#e4393c;
        background:url("img/error-ico.png") 8px 4px no-repeat #fff
    }
    .form .succ-msg{
        display:inline-block;
        *display:inline;
        *zoom:1;
        height:28px;
        line-height:28px;
        padding:0 10px 0 30px;
        vertical-align:middle;
        background:url("img/succ_18x18.png") 8px 6px no-repeat #fff;
    }
    .form-new input{float:none}
    .form-new .item{
        display:inline-block;
        display:block;
        margin: 10px 0;
        line-height:25px}
    .form-new .item:after{content:".";display:block;height:0;clear:both;visibility:hidden}
    * html .form-new .item{height:1%}*+html .form-new .item{min-height:1%}
    .form-new .item span.label{
        float:left;
        height:18px;
        line-height:18px;padding:4px 10px 3px;width:75px;text-align:left}
    .form-new .label em{color:#e4393c;margin:0 5px}
    .form-new .area,.form-new .itxt,.form-new .selt{
        line-height:18px;
        border:1px solid #ccc;
        padding:5px;
        vertical-align:middle;
        float:none;
    }
    .form-new .itxt{
        height:18px;
        width:225px;
        padding:3px 5px 2px 10px;
        outline:0;
    }
    .form-new .itxt01{width:155px}
    .form-new .telnum-prefix{
        display:inline-block;
        color:#ccc;
        background-color:#f4f4f4;
        width:48px;
        border:1px solid #ccc;
        text-align:center;
        height:23px;
        line-height:23px;
        vertical-align:middle;
    }
    .form-new .telnum-prefix-gap{
        display:inline-block;
        border-top:1px solid #bbb;
        width:5px;
        height:1px;
        margin:0 3px 0 4px;
        vertical-align:middle;
    }
    .form-new label{float:none}
    .form-new{
        float:none;
        vertical-align:-2px;
        vertical-align:-1px;
        margin:0 3px 0 0;
        padding:0
    }
    .form-new .error-msg{
        display:inline-block;
        *display:inline;
        *zoom:1;
        height:28px;
        line-height:28px;
        padding:0 10px 0 30px;
        vertical-align:middle;
        color:#e4393c;
        background:url("img/error-ico.png") 8px 4px no-repeat #fff}
    .form-new .succ-msg{
        display:inline-block;
        *display:inline;
        *zoom:1;
        height:28px;
        line-height:28px;
        padding:0 10px 0 30px;
        vertical-align:middle;
        background:url("img/succ-ico.png") 8px 6px no-repeat #fff
    }
    .btn-1 {
        font-family: arial,"Microsoft YaHei";
        display: inline-block;
        *display: inline;
        *zoom: 1;
        height: 25px;
        line-height: 25px;
        background-color: #e74649;
        background-image: -moz-linear-gradient(top,#e74649,#df3134);
        background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0,#e74649),color-stop(1,#df3134));
        -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134');
        background-image: -webkit-linear-gradient(bottom,#e74649 0,#df3134 100%);
        background-image: linear-gradient(to top,#e74649 0,#df3134 100%);
        border-radius: 3px;
        color: #fff;
        font-size: 12px;
        font-weight: 400;
        padding: 0 15px;
        cursor: pointer;
        border: 0;
        *overflow: visible;
        float: none;
    }
    .form-group{
        width: 160px;
        float: left;
        margin-left: 10px;
        margin-bottom: 0;
    }
</style>
<!-- <script type="text/javascript">
function close() {
	alert("ddd");
	$('#orderinfo_iframe').contents().find('#name_div_error').css('display','none');
	$('#orderinfo_iframe').contents().find('#phone_div_error').css('display','none');
	$('#orderinfo_iframe').contents().find('#address_div_error').css('display','none');
	$('#orderinfo_iframe').contents().find('#email_div_error').css('display','none');
	$('#orderinfo_iframe').contents().find('#phone_div_null').css('display','none');
	$('.orderinfo_setmsg').css('display','none');
	$('.ui-mask').css('display','none');
}
</script> -->
<body id="consignee_body" marginwidth="0" marginheight="0">
<div class="form-new" id="consignee-form" name="consignee-form">
    <!-- 所在地区start -->
    <div class="item mt10" id="area_div">
        <span class="label"><em>*</em>所在地区</span>
        <form class="form-inline">
            <div data-toggle="distpicker">
                <div class="form-group">
                    <label class="sr-only" for="province1">Province</label>
                    <select name="" class="form-control" id="province1"></select>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="city1">City</label>
                    <select  class="form-control" id="city1"></select>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="district1">District</label>
                    <select class="form-control" id="district1"></select>
                </div>
            </div>
        </form>
    </div>
    <!-- 所在地区end -->
    
    <!-- 详细地址start -->
    <div class="item">
        <span class="label"><em>*</em>详细地址</span>
        <div class="fl">
            <!--span id="areaNameTxt"></span-->
            <input type="text" class="itxt itxt02 setmsg_site" onblur="checksite('.setmsg_site')" id="consignee_address" name="address2" maxlength="50" value="" data-region="山东|济南市|历城区|临港街道">
            <span class="error-msg message" id="address_div_error" style="display: none">请您填写收货人详细地址</span>
        </div>
    </div>
    <!-- 详细地址end -->

    <!-- 收货人start -->
    <div class="item" id="name_div">
        <span class="label"><em>*</em>收货人</span>
        <div class="fl">
            <input type="text" class="itxt setmsg_user" onblur="checkuser('.setmsg_user')" 
            id="consignee_name" name="name" maxlength="20">
            <span class="error-msg message" id="name_div_error" style="display: none">请您填写收货人姓名</span>
        </div>
    </div>
    <!-- 收货人end -->

    <!-- 手机号码start -->
    <div class="item" id="call_div">
        <span class="label"><em>*</em>手机号码</span>
        <div class="fl">
            <span class="telnum-prefix" id="span_consignee_areaCode">0086</span>
            <span class="telnum-prefix-gap"></span>
            <input type="hidden" id="consignee_areaCode" name="consigneeParam.areaCode" value="0086">
            <input type="hidden" id="consignee_nameCode" name="consigneeParam.nameCode" value="">
            <input type="text" class="itxt setmsg_phone" id="consignee_mobile" name="phonenum" onblur="checkphone('.setmsg_phone')" onfocus="if(value == defaultValue){value='';}" maxlength="11" value="">
            <input type="hidden" id="overseaPhoneTip" value="请填写收货国家电话号码">
            <input type="hidden" id="hkmktwPhoneTip" value="请填写收货地区电话号码">
        </div>
        <span class="error-msg message" style="display: none" id="phone_div_null">请您填写收货人手机号码</span>
        <span class="error-msg message" style="display: none" style="display: none" id="phone_div_error">手机号格式不对，请重新输入</span>
    </div>
    <!-- 手机号码end -->

    <!-- 邮箱地址start -->
    <div class="item" id="email_div">
        <span class="label" id="span_consignee_email"><em>&nbsp;&nbsp;</em>邮箱地址</span>
        <div class="fl">
            <input type="text" class="itxt setmsg_email" id="consignee_email" name="email" onblur="checkemail('.setmsg_email')" maxlength="50" value="" onfocus="if(value == defaultValue){value='';}">
            <span class="error-msg" id="email_div_error" style="display: none">邮箱输入不正确</span>
            <!--            <div class="ftx-03">用来接收订单提醒邮件，便于您及时了解订单状态</div>-->
        </div>
    </div>
    <!-- 邮箱地址end -->

    <div class="item mt20">
        <span class="label">&nbsp;</span>
        <div class="fl">
            <a class="btn-1"  href="javascrip:;" onclick="setuser()">
            <span class="btn-1"  id="saveConsigneeTitleDiv">保存收货人信息</span>
            </a>
            <div class="loading loading-1" style="display:none"><b></b>正在提交信息，请等待！</div>
        </div>
        <div style="display:none"><input id="consignee_form_reset" name="" type="reset"></div>
    </div>
</div>
<span id="addNumLimitNote" class="status error" style="display:none">
        当前地址数量已达上限，若要继续添加新地址，请先删除部分收货地址。
</span>
</body>
</html>
