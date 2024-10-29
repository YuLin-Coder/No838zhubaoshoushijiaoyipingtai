<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="UTF-8">
  <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>首页</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css" />
  <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
  <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
  <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
  <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
  <script type="text/javascript">
    var CATID = "0",
      BCID = "0",
      NAVCHILDER = "",
      ONCONTEXT = 0,
      ONCOPY = 0,
      ONSELECT = 0;
  </script>
  <script type="text/javascript" src="../../xznstatic/js/common.js"></script>
</head>

<body>
  <div id="app">
    <div class="layui-carousel" id="swiper">
      <div carousel-item id="swiper-item">
        <div v-for="(item,index) in swiperList" v-bind:key="index">
          <img class="swiper-item" :src="item.img" width="100%" height="400px">
        </div>
      </div>
    </div>

    <div class="plate">
      <div class="plate-pic picture-a after tb80 back-white" style='background:#fff;'>
        <div class="container">
          <div class="comm-title">
            <div class="title">
              <h3>商品信息推荐</h3>
            </div>
          </div>
          <div class="picture-lists">
            <ul class="wul105">
              <li v-for="(item,index) in shangpinxinxiRecommend" v-bind:key="index">
                <a target="_self" :href="'../shangpinxinxi/detail.jsp?id='+item.id">
                  <div class="posi-img">
                    <img :src="item.fengmian?item.fengmian.split(',')[0]:''" width="385" height="220" />
                  </div>
                  <div class="remark">
                    <h5>商品:{{item.shangpinmingcheng}}  </h5>
                    <span style="color: red" size="30">¥{{item.discountprice}}</span>   原价: <s>{{item.price}}</s>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="plate-team team-b after tb80 back-black" style='background:#f36348;'>
        <div class="container">
          <div class="comm-title">
            <div class="title">
              <h3>新闻资讯</h3>
              <p>HOME NEWS</p>
            </div>
          </div>
          <div class="team-lists teamb-slide-38">
            <div class="hd">
              <a class="prev icon5s s5you1"></a>
              <a class="next icon5s s5zou1"></a>
            </div>
            <div class="bd">
              <ul class="wul105">
                <li v-for="(item,index) in newsList" v-bind:key="index">
                  <span class="bor-img click-more-team">
                    <img :src="item.picture" width="100" height="100" />
                  </span>
                  <div class="remark">
                    <h5>{{item.title}}</h5>
                    <span>{{item.addtime}}</span>
                    <p class="desc">{{item.content|newsDesc}}...</p>
                    <a class="click-more-team">了解详情</a>
                  </div>
                  <div class="dask-team hide">
                    <span class="team-colse icon5s s5guanbi1"></span>
                    <div class="tit">
                      <h5>{{item.title}}<span>{{item.addtime}}</span></h5>
                    </div>
                    <div class="dask-remark">
                      <div class="t-left fl">
                        <img :src="item.picture" width="280" height="280" />
                      </div>
                      <div class="t-right fr">
                        <h6>新闻内容</h6>
                        <p>{{item.content}}</p>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="dask-team-ceng hide"></div>

      <div class="plate-pic picture-a after tb80 back-white" style='background:#fff;'>
        <div class="container">
          <div class="comm-title">
            <div class="title">
              <h3>商品信息展示</h3>
              <p>DATA SHOW</p>
            </div>
          </div>
          <div class="picture-lists">
            <ul class="wul105">
              <li v-for="(item,index) in shangpinxinxiList" v-bind:key="index">
                <a target="_self" :href="'../shangpinxinxi/detail.jsp?id='+item.id">
                  <div class="posi-img">
                    <img :src="item.fengmian?item.fengmian.split(',')[0]:''" width="385" height="220" />
                  </div>
                  <div class="remark">
                    <h5>商品:{{item.shangpinmingcheng}}  </h5>
                    <span style="color: red" size="30">¥{{item.discountprice}}</span>   原价: <s>{{item.price}}</s>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="footer footer-a back-black" style='background:#F67280;'>
      <div class="container">
        <div class="footer-text center">
          <div class="links">
            <span v-text="projectName"></span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="../../layui/layui.js"></script>
  <script src="../../js/vue.js"></script>
  <script src="../../js/config.js"></script>
  <script src="../../modules/config.js"></script>
  <script src="../../js/utils.js"></script>

  <script>
    var vue = new Vue({
      el: '#app',
      data: {
        projectName: projectName,
        swiperList: [{
          img: '../../img/banner.jpg'
        }],
      shangpinxinxiRecommend: [],

      shangpinxinxiList: [],
        newsList: []
      },
      filters: {
        newsDesc: function(val) {
          if (val) {
            val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
            if (val.length > 60) {
              val = val.substring(0, 60);
            }

            return val;
          }
          return '';
        }
      },
      methods: {
        jump(url) {
          jump(url)
        }
      }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var form = layui.form;
      var carousel = layui.carousel;
      var http = layui.http;
      var jquery = layui.jquery;

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
                '<img class="swiper-item" src="' + item.value + '" width="100%" height="400px">' +
                '</div>';
            }
          }
          jquery('#swiper-item').html(swiperItemHtml);
          // 轮播图
          carousel.render({
            elem: '#swiper',
            width: '100%',
            height: '400px',
            arrow: 'always',
            anim: 'fade',
            interval: 1800,
            indicator: 'inside'
          });
        }
      });
              
      http.request('news/list', 'get', {
        page: 1,
        limit: 6,
        order: 'desc'
      }, function(res) {
        vue.newsList = res.data.list;
        vue.$nextTick(()=>{
          $(".teamb-slide-38").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "left",
            autoPlay: true,
            vis: 3,
            trigger: "click",
            interTime: 7000,
            pnLoop: false
          });
          $(".click-more-team").on("click",function () {
            var pars = $(this).parents("li");
            $(".dask-team-ceng").removeClass("hide");
            pars.find(".dask-team").removeClass("hide");
          });
          $(".team-colse").on("click",function () {
            var pars = $(this).parents(".dask-team");
            $(".dask-team-ceng").addClass("hide");
            pars.addClass("hide");
          });
        });
      });

      http.request(`shangpinxinxi/autoSort`, 'get', {
        page: 1,
        limit: 6,
        flag: 1
      }, function(res) {
        vue.shangpinxinxiRecommend = res.data.list;
      });

      http.request(`shangpinxinxi/list`, 'get', {
        page: 1,
        limit: 6,
          flag: 1
      }, function(res) {
        vue.shangpinxinxiList = res.data.list;
      });
    });
  </script>
</body>

</html>