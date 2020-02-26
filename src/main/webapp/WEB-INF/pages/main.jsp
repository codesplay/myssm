<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>
<script src="assets/jquery.min.js"></script>
</head>

<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> 运营管理平台
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="green"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="icon-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-envelope-alt"></i>
								5条消息</li>
						</ul></li>

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"><span
							class="user-info"> 
							<!-- <script type="text/javascript">
								var name = '';
								$('#adminname').val(name);alert(name);
							</script> -->
							<small>欢迎光临,${sessionScope.admin.username}</small>
						</span> <i class="icon-caret-down"></i>
					</a>
						<ul class="user-menu pull-right dropdown-menu 
									dropdown-yellow dropdown-caret 
									dropdown-close">
							<li>
								<a href="#" target="mainframe"> 
									<i class="icon-user"></i>
									个人资料
								</a>
							</li>

							<li class="divider"></li>

							<li><a href="remadmin"> <i class="icon-off"></i> 退出
							</a></li>
						</ul></li>
				</ul>

				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active">
						<a href="userlist" target="mainframe">
							<i class="icon-dashboard"></i> 
							<span class="menu-text">控制台 </span>
						</a>
					</li>

					<li>
					<a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> 
						<i class="icon-desktop"></i> 
						<span class="menu-text"> 系统管理 </span> 
						<b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">

							<li><a href="products" target="mainframe"> <i
									class="icon-double-angle-right"></i> 商品管理
							</a></li>
							<li><a href="orders" target="mainframe"> <i
									class="icon-double-angle-right"></i> 订单管理
							</a></li>
							<li><a href="carts" target="mainframe"> <i
									class="icon-double-angle-right"></i> 购物车管理
							</a></li>
							<li><a href="image_add.action" target="mainframe"> <i
									class="icon-double-angle-right"></i> 图片管理
							</a></li>
						</ul></li>
					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 营销管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">

							<li><a href="view/marketactive/template/template_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									模板管理
							</a></li>
							<li><a
								href="view/marketactive/messafeinfo/messafeinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									短信管理
							</a></li>
							<li><a
								href="view/marketactive/emailinfo/emailinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									邮件管理
							</a></li>
							<li><a
								href="view/marketactive/marketactive/marketactive_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>营销活动
							</a></li>
						</ul></li>
					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 招生管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">

							<li><a
								href="view/recruitstudent/studentpool/studentpool_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员池
							</a></li>
							<li><a
								href="view/recruitstudent/recruitstudent/recruitstudent_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									招生线索
							</a></li>
							<li><a
								href="view/recruitstudent/trackrecord/trackrecord_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									跟踪记录
							</a></li>
							<li><a
								href="view/recruitstudent/auditioninfo/auditioninfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									试听记录
							</a></li>
						</ul></li>

					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 班级管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">

							<li><a
								href="view/classinfo/disciplineinfo/disciplineinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学科信息
							</a></li>
							<li><a
								href="view/classinfo/classroominfo/classroominfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									教室信息
							</a></li>
							<li><a
								href="view/classinfo/syllabusinfo/syllabusinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									课程表
							</a></li>
							<li><a href="view/classinfo/teacher/teacher_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									教师管理
							</a></li>
							<li><a href="view/classinfo/classinfo/classinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									班级管理
							</a></li>
						</ul></li>
					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 学员管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="view/student/student/student_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员信息
							</a></li>
							<li><a
								href="view/student/evaluationinfo/evaluationinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员评价
							</a></li>
							<li><a
								href="view/student/communicateinfo/communicateinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									沟通记录
							</a></li>
							<li><a
								href="view/student/studentwritegrade/studentwritegrade_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员成绩
							</a></li>
						</ul></li>

					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 教务管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="view/student/student/student_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									班级事务
							</a></li>
							<li><a
								href="view/student/evaluationinfo/evaluationinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员考勤
							</a></li>

						</ul></li>

					<li><a href="javascript:void(0)" target="mainframe"
						class="dropdown-toggle"> <i class="icon-desktop"></i> <span
							class="menu-text"> 财务管理 </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="view/student/student/student_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									学员缴费
							</a></li>
							<li><a
								href="view/student/evaluationinfo/evaluationinfo_list.html"
								target="mainframe"> <i class="icon-double-angle-right"></i>
									员工薪水
							</a></li>

						</ul></li>
				</ul>
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content" id="mains">
				<iframe id="mainframe" name="mainframe" src="userlist"
					style="width: 100%; border: 0px;"> </iframe>
			</div>

			<script type="text/javascript">
				var height = jQuery(window).height() - 50;
				jQuery("#mainframe").attr("height", "" + height + "px;");
				jQuery(window).resize(function() {
					var height = jQuery(window).height() - 50;
					jQuery("#mainframe").attr("height", "" + height + "px;");
				})
			</script>

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-navbar" /> <label class="lbl"
							for="ace-settings-navbar"> 固定导航条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定滑动条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-breadcrumbs" /> <label class="lbl"
							for="ace-settings-breadcrumbs">固定面包屑</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl">切换到左边</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-add-container" /> <label class="lbl"
							for="ace-settings-add-container"> 切换窄屏 <b></b>
						</label>
					</div>
				</div>
			</div>
			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->




	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/jquery.slimscroll.min.js"></script>
	<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
	<script src="assets/js/jquery.sparkline.min.js"></script>
	<script src="assets/js/flot/jquery.flot.min.js"></script>
	<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
	<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {
			$('.easy-pie-chart.percentage')
					.each(
							function() {
								var $box = $(this).closest('.infobox');
								var barColor = $(this).data('color')
										|| (!$box.hasClass('infobox-dark') ? $box
												.css('color')
												: 'rgba(255,255,255,0.95)');
								var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
										: '#E2E2E2';
								var size = parseInt($(this).data('size')) || 50;
								$(this)
										.easyPieChart(
												{
													barColor : barColor,
													trackColor : trackColor,
													scaleColor : false,
													lineCap : 'butt',
													lineWidth : parseInt(size / 10),
													animate : /msie\s*(8|7|6)/
															.test(navigator.userAgent
																	.toLowerCase()) ? false
															: 1000,
													size : size
												});
							})

			$('.sparkline').each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = !$box.hasClass('infobox-dark') ? $box
								.css('color') : '#FFF';
						$(this).sparkline('html', {
							tagValuesAttribute : 'data-values',
							type : 'bar',
							barColor : barColor,
							chartRangeMin : $(this).data('min') || 0
						});
					});

			var placeholder = $('#piechart-placeholder').css({
				'width' : '90%',
				'min-height' : '150px'
			});
			var data = [ {
				label : "social networks",
				data : 38.7,
				color : "#68BC31"
			}, {
				label : "search engines",
				data : 24.5,
				color : "#2091CF"
			}, {
				label : "ad campaigns",
				data : 8.2,
				color : "#AF4E96"
			}, {
				label : "direct traffic",
				data : 18.6,
				color : "#DA5430"
			}, {
				label : "other",
				data : 10,
				color : "#FEE074"
			} ]
			function drawPieChart(placeholder, data, position) {
				$.plot(placeholder, data, {
					series : {
						pie : {
							show : true,
							tilt : 0.8,
							highlight : {
								opacity : 0.25
							},
							stroke : {
								color : '#fff',
								width : 2
							},
							startAngle : 2
						}
					},
					legend : {
						show : true,
						position : position || "ne",
						labelBoxBorderColor : null,
						margin : [ -30, 15 ]
					},
					grid : {
						hoverable : true,
						clickable : true
					}
				})
			}
			drawPieChart(placeholder, data);

			/**
			we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			so that's not needed actually.
			 */
			placeholder.data('chart', data);
			placeholder.data('draw', drawPieChart);

			var $tooltip = $(
					"<div class='tooltip top in'><div class='tooltip-inner'></div></div>")
					.hide().appendTo('body');
			var previousPoint = null;

			placeholder.on('plothover', function(event, pos, item) {
				if (item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : "
								+ item.series['percent'] + '%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({
						top : pos.pageY + 10,
						left : pos.pageX + 10
					});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}

			});

			var d1 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d1.push([ i, Math.sin(i) ]);
			}

			var d2 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d2.push([ i, Math.cos(i) ]);
			}

			var d3 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.2) {
				d3.push([ i, Math.tan(i) ]);
			}

			var sales_charts = $('#sales-charts').css({
				'width' : '100%',
				'height' : '220px'
			});
			$.plot("#sales-charts", [ {
				label : "Domains",
				data : d1
			}, {
				label : "Hosting",
				data : d2
			}, {
				label : "Services",
				data : d3
			} ], {
				hoverable : true,
				shadowSize : 0,
				series : {
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				xaxis : {
					tickLength : 0
				},
				yaxis : {
					ticks : 10,
					min : -2,
					max : 2,
					tickDecimals : 3
				},
				grid : {
					backgroundColor : {
						colors : [ "#fff", "#fff" ]
					},
					borderWidth : 1,
					borderColor : '#555'
				}
			});

			$('#recent-box [data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('.tab-content')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}

			$('.dialogs,.comments').slimScroll({
				height : '300px'
			});

			//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
			//so disable dragging when clicking on label
			var agent = navigator.userAgent.toLowerCase();
			if ("ontouchstart" in document && /applewebkit/.test(agent)
					&& /android/.test(agent))
				$('#tasks').on('touchstart', function(e) {
					var li = $(e.target).closest('#tasks li');
					if (li.length == 0)
						return;
					var label = li.find('label.inline').get(0);
					if (label == e.target || $.contains(label, e.target))
						e.stopImmediatePropagation();
				});

			$('#tasks').sortable({
				opacity : 0.8,
				revert : true,
				forceHelperSize : true,
				placeholder : 'draggable-placeholder',
				forcePlaceholderSize : true,
				tolerance : 'pointer',
				stop : function(event, ui) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
					$(ui.item).css('z-index', 'auto');
				}
			});
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click',
					function() {
						if (this.checked)
							$(this).closest('li').addClass('selected');
						else
							$(this).closest('li').removeClass('selected');
					});

		})
	</script>
</body>
</html>