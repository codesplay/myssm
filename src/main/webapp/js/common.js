//正则表达式判断手机号
function isPhoneNumber(tel) {
	var reg =/^1[3|4|5|6|7|8|9][0-9]{9}$/;
	return reg.test(tel);
}
//rgb转#
function rgb2hex(rgb) {
	rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	function hex(x) {
		return ("0" + parseInt(x).toString(16)).slice(-2);
	}
	return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}
$(function(){
	//jindex
	var list = document.getElementsByClassName('f2cc_goods_list');
	var items;
	var num;
	var id = 'list0';
	var prenum = 0;
	$('.f2cc_tab_items').hover(function () {
		$('.f2cc_tab_items').css('background','rgb(255,255,255)');
		$(this).css('background','rgb(221, 69, 69)');
		items = $(this);
		id = $(this).attr("id");
		$('.f2cc_tab_items').css('color','black');
		$(this).css('color','white');
		num = $(this).attr('list');
		list[prenum].style.display = "none";
		list[num].style.display = "block";
		prenum = num;
	},function () {

	});

	//登录输入框效果
	$('.form_text_ipt input').focus(function(){
		$(this).parent().css({
			'box-shadow':'0 0 3px #bbb',
		});
	});
	$('.form_text_ipt input').blur(function(){
		$(this).parent().css({
			'box-shadow':'none',
		});
		//$(this).parent().next().hide();
	});
	
	$('#login-form').click(function(){
		var u = $('#login-username');
		var p = $('#login-password');
		if(u.val()==""){
			u.css({
				'color':'red',
			});
			u.parent().css({
				'border':'solid 1px red',
			});
			u.parent().next().css({'display':'block',});
			if(p.val() == ""){
				p.css({
					'color':'red',
				});
				p.parent().css({
					'border':'solid 1px red',
				});
				p.parent().next().css({'display':'block',});
			}
		}else{
			if(p.val() == ""){
				p.css({
					'color':'red',
				});
				p.parent().css({
					'border':'solid 1px red',
				});
				p.parent().next().css({'display':'block',});
			}else{
				 $('#form-postuser').submit();
			}
		}
		
	});
	
	$('#Jreg-post').click(function(){
		var list = $("#Jreg-inputs input");
		var i = 0;
		for(i;i<list.length;i++){
			if(list.eq(i).val() == ""){
				list.eq(i).css({
					'color':'red',
				});
				list.eq(i).parent().css({
					'border':'solid 1px red',
				});
				list.eq(i).parent().next().css({'display':'block',});
			}
		}
		if($('#repassword').val()==$('#password').val()){
			if(i==list.length){
				$('#Jreg-postform').submit();
			}
		}else{
			$('#repassword').parent().next().next().css({'display':'block',});
		}
	});
	
	
	//表单验证
	$('.form_text_ipt input').bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			$(this).parent().next().css({'display':'block',});
			$("#login").attr('disabled',true);
		}else{
			$(this).css({
				'color':'#ccc',
			});
			$(this).parent().css({
				'border':'solid 1px #ccc',
			});
			$(this).parent().next().css({'display':'none',});
			$("#login").attr('disabled',false);
			$('#repassword').bind('input',function () {
				if($(this).val() != $('#password').val()){
					if($(this).val() != ""){
						$(this).parent().next().next().css({'display':'block',});
						$("#login").attr('disabled',true);
					}else{
						$(this).parent().next().next().css({'display':'none',});
						$("#login").attr('disabled',false);
					}
				}else{
					$(this).parent().next().next().css({'display':'none',});
					$("#login").attr('disabled',false);

				}
			});
			$('.userphone').bind('input propertychange',function () {
				if(!isPhoneNumber($(this).val())){
					if($(this).val() != ""){
						$(this).parent().next().next().css({'display':'block',});
						$("#login").attr('disabled',true);
					}else{
						$(this).parent().next().next().css({'display':'none',});
						$("#login").attr('disabled',false);
					}
				}else{
					$(this).parent().next().next().css({'display':'none',});
					$("#login").attr('disabled',false);

				}
			});
		}
	});
	$('.orderinfo_ui').click(function () {
		$('#orderinfo_iframe').contents().find('#name_div_error').css('display','none');
		$('#orderinfo_iframe').contents().find('#phone_div_error').css('display','none');
		$('#orderinfo_iframe').contents().find('#address_div_error').css('display','none');
		$('#orderinfo_iframe').contents().find('#email_div_error').css('display','none');
		$('#orderinfo_iframe').contents().find('#phone_div_null').css('display','none');
		$('.orderinfo_setmsg').css('display','none');
		$('.ui-mask').css('display','none');

	});

	//修改收件人
	setuser = function (){
		if($('#consignee_name').val()!=""&&$('#consignee_address').val()!=""
				&&$('#consignee_mobile').val()!=""&&$('#consignee_email').val()!=""){
			var s1 = $('#province1 option:selected');
			var s2 = $('#city1 option:selected');
			var s3 = $('#district1 option:selected');
			var t1 = s1.text();
			var t2 = s2.text();
			var t3 = s3.text();
			var t4 = $('#consignee_email').val();
			$('#orderinfo_email',window.parent.document).val(t4);
			$('.orderinfo_addrsite',window.parent.document).html(t1+' '+t2+' '+t3+' '+t4);
			$('.orderinfo_addrname',window.parent.document).html($('#consignee_name').val());
			$('.orderinfo_addrtel',window.parent.document).html($('#consignee_mobile').val());
			$('.orderinfo_setmsg',window.parent.document).css('display','none');
			$('.ui-mask',window.parent.document).css('display','none');
		}
	}
	
	function isnum(num){
		reg = /^[0-9]+[0-9]*$/;
		return reg.test(num);
	}
	$('#buy_num').bind('input propertychange',function () {
		if(isnum($(this).val())) {
			if (parseInt($(this).val()) < 1 || parseInt($(this).val()) > parseInt($(this).attr("data-max"))) {
				$(this).val(1);
			}
		}else{
			$(this).val(1);
		}
	});
	var num = $('#payfor_num');
	var money = $('#payfor_money');
	$('.checkall').click(function () {
		if(!$('.checkall').prop("checked")){
			$('.cart_check').prop("checked",false);
			$('.checkallfixed').prop("checked",false);
			num.text('0');
			money.text('0');
		}else{
			$('.cart_check').prop("checked",true);
			$('.checkallfixed').prop("checked",true);
			getselect();
		}
	});
	$('.cart_check').click(function () {
		if(!$(this).prop("checked")){
			$('.checkallfixed').prop("checked",false);
			$('.checkall').prop("checked",false);
			getselect();
		}else{
			getselect();
		}
	});
	
	$('.orderinfo_input').click(function () {
		$('.orderinfo_setmsg').css('display','block');
		$('.ui-mask').css('display','block');
	});
	$('.flow_more').click(function () {
		if(rgb2hex($(this).css('color')) == "#ff6600"){
			$(this).css('color','#333');
		}else {
			$(this).css('color','#f60');
			$('.flow_num').css('color','#333');
			$('.flow_price').css('color','#333');
			$('.flow_num i').css('background','url("img/icon_rank.png") no-repeat 0 0');
			$('.flow_price i').css('background','url("img/icon_pricenormal.png") no-repeat 0 0');
		}

	});
	$('.flow_num').click(function () {
		if(rgb2hex($(this).css('color')) == '#ff6600'){
			$(this).css('color','#333');
			$('.flow_num i').css('background','url("img/icon_rank.png") no-repeat 0 0');
		}else {
			$(this).css('color','#f60');
			$('.flow_num i').css('background','url("img/icon_rankcur.png") no-repeat 0 0');
			$('.flow_price i').css('background','url("img/icon_pricenormal.png") no-repeat 0 0');
			$('.flow_more').css('color','#333');
			$('.flow_price').css('color','#333');
		}
	});
	$('.flow_price').click(function () {
		if(rgb2hex($(this).css('color')) == '#ff6600'){
			$(this).css('color','#333');
			$('.flow_price i').css('background','url("img/icon_pricedown.png") no-repeat 0 0');
		}else {
			$(this).css('color','#f60');
			$('.flow_num i').css('background','url("img/icon_rank.png") no-repeat 0 0');
			$('.flow_price i').css('background','url("img/icon_priceup.png") no-repeat 0 0');
			$('.flow_more').css('color','#333');
			$('.flow_num').css('color','#333');
		}
	});

});
function add(a){
	var b = parseInt($(a).val()) + 1;
	if(b > parseInt($(a).attr("data-max"))){
		$('.add_num').css('color','#ccc');
	}else{
		$(a).val(b);
		var m = a.match(/^(.*)_([a-z]+)([0-9]+)$/);
		var sum =$('#proprice_1').attr('value')*b;
		$('#buymoney_'+m[3]).attr('value',sum);
		$('#buymoney_'+m[3]).html('￥'+sum);
		if($('#checkbox'+m[3]).prop("checked")){
			getselect();
		}
	}
}
function reduce(a){
	var b = parseInt($(a).val()) - 1;
	if(b < 1){
		$('.sub_num').css('color','#ccc');
	}else{
		$(a).val(b);
		var m = a.match(/^(.*)_([a-z]+)([0-9]+)$/);
		if($('#checkbox'+m[3]).prop("checked")){
			getselect();
		}
	}
}
function check(a) {
	var num = $('#payfor_num');
	var money = $('#payfor_money');
	if(!$(a).prop("checked")){
		$('.cart_check').prop("checked",false);
		$('.checkall').prop("checked",false);
		num.text('0');
		money.text('0');
	}else{
		$('.cart_check').prop("checked",true);
		$('.checkall').prop("checked",true);
		getselect();
	}
}
function getselect() {
	var num = 0;
	var money = 0;
	var sinnum;
	var list = document.getElementsByClassName('cart_check');
	for(var i = 0;i < list.length;i++){
		if($(list[i]).prop("checked")){
			sinnum = parseInt($('#buy_num'+(i+1)).val());
			num += sinnum;
			money += sinnum*parseInt($(list[i]).parent().parent().find('.item_money').text());
		}
	}
	$('#payfor_num').text(num);
	$('#payfor_money').text(money);
}
function checkuser(a) {
	if($(a).val() == ""){
		$('#name_div_error').css('display','inline-block');
	}else{
		$('#name_div_error').css('display','none');
	}
}
function checkphone(a) {
	if($(a).val() == ""){
		$('#phone_div_null').css('display','inline-block');
	}else{
		$('#phone_div_null').css('display','none');
		if(isPhoneNumber($(a).val())){
			$('#phone_div_error').css('display','inlien-block');
		}else{
			$('#phone_div_error').css('display','none');
		}
	}
}
function checksite(a) {
	if($(a).val() == ""){
		$('#address_div_error').css('display','inline-block');
	}else{
		$('#address_div_error').css('display','none');
	}
}
function checkemail(a) {
	if($(a).val() == ""){
		$('#email_div_error').css('display','inline-block');
	}else{
		$('#email_div_error').css('display','none');
	}
}

