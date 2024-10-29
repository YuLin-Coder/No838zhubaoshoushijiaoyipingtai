<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 订单 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>订单</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />



		<script type="text/javascript" charset="utf-8">
            window.UEDITOR_HOME_URL = "../../../resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
		</script>
		<script type="text/javascript" charset="utf-8"
				src="../../../resources/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8"
				src="../../../resources/ueditor/ueditor.all.min.js"></script>
		<script type="text/javascript" charset="utf-8"
				src="../../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>
	<body style="background: #EEEEEE;">

		<div id="app">

			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div>
			<!-- 轮播图 -->

			<!-- 标题 -->
			<h2 style="margin-top: 20px;" class="index-title">USER / ORDER</h2>
			<div class="line-container">
				<p class="line" style="background: #EEEEEE;"> 我的订单 </p>
			</div>
			<!-- 标题 -->

			<%-- 添加售后订单--%>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<input type="hidden" id="orderid">
							<label>
								商品问题
								<input type="text" id="suqiu" name="suqiu" class="form-control" placeholder="商品问题">
							</label>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="button" @click="addshouhou()" class="btn btn-primary">
								提交
							</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
			<div class="center-container" style="width: auto;">
				<!-- 个人中心菜单 config.js-->
				<!-- <div class="left-container">
					<ul class="layui-nav layui-nav-tree">
						<li v-for="(item,index) in centerMenu" v-bind:key="index" class="layui-nav-item" :class="item.url=='../order/list.jsp'?'layui-this':''">
							<a :href="'javascript:jump(\''+item.url+'\')'">{{item.name}}</a>
						</li>
					</ul>
				</div> -->
				<!-- 个人中心菜单 -->
				<span class="right-container" style="padding-top: 0;">
					<span class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
						<ul class="layui-tab-title">
							<li @click="pageList('未支付')" class="layui-this">未支付</li>
							<li @click="pageList('已支付')">已支付</li>
							<li @click="pageList('已发货')">已发货</li>
							<li @click="pageList('已完成')">已完成</li>
							<li @click="pageList('已退款')">已退款</li>
							<li @click="pageList('已取消')">已取消</li>
						</ul>
						<span class="layui-tab-content">
							<table id ="showtable" class="layui-table" lay-skin="nob">
								<thead>
									<tr id="tr">
									</tr>
								</thead>
								<tbody>
									<tr v-for="(item,index) in dataList" v-bind:key="index">
										<td style="width: 50px;">
											{{item.orderid}}
										</td>
										<td style="display: flex;text-align: left;width: 250px;">
											<img :src="item.picture" style="width: 100px;height: 100px;object-fit: cover;">
											<div style="margin-left: 10px;margin-top: 10px;">
												{{item.goodname}}
											</div>
										</td>
										<td style="width: 100px;">{{item.discountprice}} RMB</td>
										<td style="width: 50px;">
											{{item.buynumber}}
										</td>
										<td style="width: 100px;">{{item.discountprice*item.buynumber}} RMB</td>
										<td style="width: 200px;">
											{{item.address}}
										</td>

			<td v-show="item.status=='已完成' && item.shouhouid != null " style="width: 1000px;">{{item.suqiu}}</td>
			<td v-show="item.status=='已完成' && item.shouhouid != null " style="width: 200px;">{{item.suqiutime}}</td>
			<td v-show="item.status=='已完成' && item.shouhouid != null " style="width: 100px;">{{item.shouhouvalue}}</td>

			<td v-show="item.status=='已完成' && item.shouhouid == null " style="width: 200px;">没有售后纠纷</td>
			<td v-show="item.status=='已完成' && item.shouhouid == null " style="width: 200px;"></td>
			<td v-show="item.status=='已完成' && item.shouhouid == null " style="width: 100px;"></td>


										<td style="width: 100px;">
											<button v-if="item.status=='未支付'" @click="pay(item)" type="button" class="layui-btn layui-btn-sm layui-btn-radius btn-theme">
												<i class="layui-icon">&#xe65e;</i> 支付
											</button>
											<button v-if="item.status=='已支付'" @click="refund(item)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
												<i class="layui-icon">&#xe65e;</i> 退款
											</button>
											<button v-if="item.status=='已发货'" @click="confirm(item)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-bg-green">
												<i class="layui-icon">&#xe65e;</i> 确认收货
											</button>
											<button v-if="item.status=='已完成'" type="button" @click="updateParams(item.orderid)" class="btn btn-primary  btn-sm">
												 售后
											</button>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="pager" id="pager"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>

		<script src="../../../resources/js/jquery-3.2.1.min.js"></script>
		<script src="../../../resources/js/bootstrap.min.js"></script>
		<script>


/*
            $('#suqiuupload').fileupload({
                url: 'http://localhost:8080/zhubaoshoushijiaoyipingtai/file/upload',
                headers: {token: window.sessionStorage.getItem("token")},
                dataType: 'json',
                done: function (e, data) {
                    UE.getEditor('suqiuEditor').execCommand('insertHtml', '<img src=\"http://localhost:8080/zhubaoshoushijiaoyipingtai/file/upload/' + data.result.file + '\" width=900 height=560>');
                }
            });



            // 获取富文本框内容
            function getContent() {
                if (UE.getEditor('suqiuEditor').hasContents()) {
                    $('#suqiu').attr('value', UE.getEditor('suqiuEditor').getPlainTxt());
                }
            }*/


			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					dataList: [],
					centerMenu: centerMenu,
					status: '未支付',
					limit: 10,
					user: {}
				},
				methods: {
					jump(url) {
						jump(url)
					},
					pageList(status) {
						this.status = status;
						// 获取列表数据
						layui.http.request('orders/list', 'get', {
							page: 1,
							limit: this.limit,
							userid: localStorage.getItem('userid'),
							status: vue.status
						}, function(res) {
							vue.dataList = res.data.list
                            var a;
                            if(vue.status =="已完成"){

                                a="<th id=\"qwqw\">订单编号</th>\n" +
                                    "\t<th>商品</th>\n" +
                                    "\t<th>价格</th>\n" +
                                    "\t<th>数量</th>\n" +
                                    "\t<th>总价</th>\n" +
                                    "\t<th>地址</th>\n" +
                                    "\t<th>诉求内容</th>\n" +
                                    "\t<th>诉求时间</th>\n" +
                                    "\t<th>是否处理</th>\n" +
                                    "\t<th>操作</th>";
                            }else{
                                a="<th>订单编号</th>\n" +
                                    "\t<th>商品</th>\n" +
                                    "\t<th>价格</th>\n" +
                                    "\t<th>数量</th>\n" +
                                    "\t<th>总价</th>\n" +
                                    "\t<th>地址</th>\n" +
                                    "\t<th>操作</th>";
                            }

                            $('#showtable #tr').html(a);



							/*// 分页
							layui.laypage.render({
								elem: 'pager',
								count: res.data.total,
								limit: this.limit,
								jump: function(obj, first) {
									//首次不执行
									if (!first) {
										layui.http.request('orders/list7878', 'get', {
											page: obj.curr,
											limit: obj.limit,
											userid: localStorage.getItem('userid'),
											status: this.status
										}, function(res) {
										    alert(444);
										    debugger
											this.dataList = res.data.list
                                            var a;
                                            alert("上面获取数据1");
                                            // if($("#qwqw").val() !=null) {
                                            $('#showtable tr').empty();
                                                if (vue.status == "已完成") {
                                                    a = "<th>订单编号</th>\n" +
                                                        "\t<th>商品</th>\n" +
                                                        "\t<th>价格</th>\n" +
                                                        "\t<th>数量</th>\n" +
                                                        "\t<th>总价</th>\n" +
                                                        "\t<th>地址</th>\n" +
                                                        "\t<th>诉求内容</th>\n" +
                                                        "\t<th>诉求时间</th>\n" +
                                                        "\t<th>是否处理</th>\n" +
                                                        "\t<th>操作</th>";
                                                } else {
                                                    a = "<th>订单编号</th>\n" +
                                                        "\t<th>商品</th>\n" +
                                                        "\t<th>价格</th>\n" +
                                                        "\t<th>数量</th>\n" +
                                                        "\t<th>总价</th>\n" +
                                                        "\t<th>地址</th>\n" +
                                                        "\t<th>操作</th>";
                                                }
                                                $('#showtable tr').html(a);
                                            // }

										})
									}
								}
							});*/
						})
					},

                    updateParams(orderid) {
                        $("#orderid").val(orderid);//设置订单id
                        $('#myModal').modal('show');//打开模态框

                    },
                    addshouhou() {
					    var ti = this;
                        var suqiu = $("#suqiu").val();
                        var orderid = $("#orderid").val();

                        layui.http.requestJson('shouhou/add', 'post', {
                            suqiu: suqiu,
                            orderid: orderid,
                            userid: localStorage.getItem('userid')
                        }, function(res) {
                            alert("添加售后成功");
                            $('#myModal').modal('hide');//打开模态框
                            ti.pageList("已完成");
                        })

                    },
					// 支付
					pay(item) {
						// 获取商品详情信息
						layui.http.request(`${item.tablename}/info/${item.goodid}`, 'get', {}, (res) => {
							// 商品信息
							let data = res.data;
							// 用户当前用户信息
							let table = localStorage.getItem("userTable");
							layui.http.request(`${table}/session`, 'get', {}, function(data) {
								this.user = data.data;
								// 判断余额是否充足
								if (this.user.money < this.totalPrice) {
									layui.layer.msg('余额不足，请先充值', {
										time: 2000,
										icon: 5
									});
									return
								}
								debugger
								// 如果该商品存在积分
								if (data.jifen) {
									this.user.jifen = Number(this.user.jifen) + Number(data.jifen * item.buynumber);
								}
								this.user.money = this.user.money - this.totalPrice;
								// 更新用户余额
								layui.http.requestJson(`${localStorage.getItem("userTable")}/update`, 'post', this.user, (res) => {
									item.status = '已支付'
									layui.http.requestJson(`orders/update`, 'post', item, (res) => {
										layui.layer.msg('支付成功', {
											time: 2000,
											icon: 6
										}, function() {
											window.location.reload();
										});
									});
								});
							});
						});
					},
					// 退款
					refund(item) {
						// 获取商品详情信息
						layui.http.request(`${item.tablename}/info/${item.goodid}`, 'get', {}, (res) => {
							// 商品信息
							let data = res.data;
							// 用户当前用户信息
							let table = localStorage.getItem("userTable");
							layui.http.request(`${table}/session`, 'get', {}, function(data) {
								this.user = data.data;
								// 如果该商品存在积分
								if (data.jifen) {
									this.user.jifen = Number(this.user.jifen) - Number(data.jifen * item.buynumber);
								}
								this.user.money = this.user.money + this.totalPrice;
								// 更新用户余额
								layui.http.requestJson(`${localStorage.getItem("userTable")}/update`, 'post', this.user, (res) => {
									item.status = '已退款'
									layui.http.requestJson(`orders/update`, 'post', item, (res) => {
										layui.layer.msg('退款成功', {
											time: 2000,
											icon: 6
										}, function() {
											window.location.reload();
										});
									});
								});
							});
						});
					},
					confirm(item){
						item.status = '已完成'
						layui.http.requestJson(`orders/update`, 'post', item, (res) => {
							layui.layer.msg('确认收货成功', {
								time: 2000,
								icon: 6
							}, function() {
								window.location.reload();
							});
						});
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'laypage'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var laypage = layui.laypage;
				var form = layui.form;

				var limit = 10;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						carousel.render({
							elem: '#swiper',
							width: swiper.width,height:swiper.height,
							arrow: swiper.arrow,
							anim: swiper.anim,
							interval: swiper.interval,
							indicator: "none"
						});
					}
				});

				// 获取列表数据
				http.request('orders/list', 'get', {
					page: 1,
					limit: limit,
					userid: localStorage.getItem('userid'),
					status: vue.status
				}, function(res) {
					vue.dataList = res.data.list
                    var a;

					if(vue.status =="已完成"){
						a="<th  id=\"qwqw\" >订单编号</th>\n" +
                            "\t<th>商品</th>\n" +
                            "\t<th>价格</th>\n" +
                            "\t<th>数量</th>\n" +
                            "\t<th>总价</th>\n" +
                            "\t<th>地址</th>\n" +
                            "\t<th>诉求内容</th>\n" +
                            "\t<th>诉求时间</th>\n" +
                            "\t<th>是否处理</th>\n" +
                            "\t<th>操作</th>";
					}else{
                        a="<th id=\"qwqw\" >订单编号</th>\n" +
                            "\t<th>商品</th>\n" +
                            "\t<th>价格</th>\n" +
                            "\t<th>数量</th>\n" +
                            "\t<th>总价</th>\n" +
                            "\t<th>地址</th>\n" +
                            "\t<th>操作</th>";
					}
                    $('#showtable #tr').html(a);
					// 分页
					/*laypage.render({
						elem: 'pager',
						count: res.data.total,
						limit: vue.limit,
						jump: function(obj, first) {
							//首次不执行

                            alert("分页"+first);
							if (!first) {
								http.request('orders/list8787', 'get', {
									page: obj.curr,
									limit: obj.limit,
									userid: localStorage.getItem('userid'),
									status: vue.status
								}, function(res) {

                                    alert(2);
                                    debugger

									vue.dataList = res.data.list;
                                    var a;
                                    $('#showtable tr').empty();
                                    // if($("#qwqw").val() !=null){
										if(vue.status =="已完成"){
											a="<th id=\"qwqw\" >订单编号</th>\n" +
												"\t<th>商品</th>\n" +
												"\t<th>价格</th>\n" +
												"\t<th>数量</th>\n" +
												"\t<th>总价</th>\n" +
												"\t<th>地址</th>\n" +
												"\t<th>诉求内容</th>\n" +
												"\t<th>诉求时间</th>\n" +
												"\t<th>是否处理</th>\n" +
												"\t<th>操作</th>";
										}else{
											a="<th id=\"qwqw\" >订单编号</th>\n" +
												"\t<th>商品</th>\n" +
												"\t<th>价格</th>\n" +
												"\t<th>数量</th>\n" +
												"\t<th>总价</th>\n" +
												"\t<th>地址</th>\n" +
												"\t<th>操作</th>";
										}
										$('#showtable tr').html(a);
                                    // }


								})
							}
						}
					});*/
				})

			});




		</script>
	</body>
</html>
