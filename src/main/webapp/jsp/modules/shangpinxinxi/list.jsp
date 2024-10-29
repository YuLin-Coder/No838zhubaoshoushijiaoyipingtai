<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
</head>
<style>

</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">
                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">商品信息管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">商品信息管理</li>
                        <li class="breadcrumb-item active">商品信息列表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">商品信息列表</h3>
                        <div class="table-responsive mb-3">
                            <div class="col-sm-12">
                                <label>
                                    商品名称
                                    <input type="text" id="shangpinmingchengSearch" class="form-control form-control-sm"
                                           placeholder="" aria-controls="tableId">
                                </label>
                                <label>
                                    商品分类
                                    <select name="shangpinfenlei" id="shangpinfenleiSelect"
                                            class="form-control form-control-sm" aria-controls="tableId">
                                    </select>
                                </label>
                                <label>
                                    品牌
                                    <input type="text" id="pinpaiSearch" class="form-control form-control-sm"
                                           placeholder="" aria-controls="tableId">
                                </label>
                                <label>
                                    规格
                                    <input type="text" id="guigeSearch" class="form-control form-control-sm"
                                           placeholder="" aria-controls="tableId">
                                </label>
                                <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
                                <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                            </div>
                            <table id="tableId" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th class="no-sort" style="min-width: 35px;">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="select-all"
                                                   onclick="chooseAll()">
                                            <label class="custom-control-label" for="select-all"></label>
                                        </div>
                                    </th>
                                    <th onclick="sort('shangpinbianhao')">商品编号<i id="shangpinbianhaoIcon"
                                                                                 class="fa fa-sort"></i></th>
                                    <th onclick="sort('shangpinmingcheng')">商品名称<i id="shangpinmingchengIcon"
                                                                                   class="fa fa-sort"></i></th>
                                    <th onclick="sort('shangpinfenlei')">商品分类<i id="shangpinfenleiIcon"
                                                                                class="fa fa-sort"></i></th>
                                    <th onclick="sort('shuliang')">数量<i id="shuliangIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('pinpai')">品牌<i id="pinpaiIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('guige')">规格<i id="guigeIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('xiangqing')">详情<i id="xiangqingIcon" class="fa fa-sort"></i></th>

                                    <th>封面</th>
                                    <th onclick="sort('price')">原价<i id="priceIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('discountprice')">折扣价<i id="discountpriceIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('flag')">上下架<i id="flagIcon" class="fa fa-sort"></i></th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="col-md-6 col-sm-3">
                                <div class="dataTables_length" id="tableId_length">

                                    <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                            onchange="changePageSize()">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    条 每页

                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                        <a class="page-link" href="#" tabindex="-1">上一页</a>
                                    </li>

                                    <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                        <a class="page-link" href="#">下一页</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                            <input type="hidden" id="flag">
                            <input type="hidden" id="updateid">
                            <label>数量</label>
                            <input type="number" id="shuliang" name="shuliang" class="form-control" placeholder="数量">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" onclick="updateShuliang()" class="btn btn-primary">
                            提交
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script language="javascript" type="text/javascript"
        src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>

<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>
    <%@ include file="../../static/getRoleButtons.js"%>
    <%@ include file="../../static/crossBtnControl.js"%>
    var tableName = "shangpinxinxi";
    var pageType = "list";
    var searchForm = {key: ""};
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = '';
    var sortOrder = '';
    var ids = [];
    var checkAll = false;

    var shangpinfenleiOptions = [];

    function init() {
        // 满足条件渲染提醒接口
    }

    // 改变每页记录条数
    function changePageSize() {
        var selection = document.getElementById('selectPageSize');
        var index = selection.selectedIndex;
        pageSize = selection.options[index].value;
        getDataList();
    }

    //排序
    function sort(columnName) {
        var iconId = '#' + columnName + 'Icon'
        $('th i').attr('class', 'fa fa-sort');
        if (sortColumn == '' || sortColumn != columnName) {
            sortColumn = columnName;
            sortOrder = 'asc';
            $(iconId).attr('class', 'fa fa-sort-asc');
        }
        if (sortColumn == columnName) {
            if (sortOrder == 'asc') {
                sortOrder = 'desc';
                $(iconId).attr('class', 'fa fa-sort-desc');
            } else {
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
        }
        pageIndex = 1;
        getDataList();
    }

    // 查询
    function search() {
        searchForm = {key: ""};
        if ($('#shangpinmingchengSearch').val() != null && $('#shangpinmingchengSearch').val() != '') {
            searchForm.shangpinmingcheng = "%" + $('#shangpinmingchengSearch').val() + "%";
        }

        var shangpinfenleiIndex = document.getElementById("shangpinfenleiSelect").selectedIndex;
        var shangpinfenleiOptions = document.getElementById("shangpinfenleiSelect").options;
        var shangpinfenleiSelectedOption = shangpinfenleiOptions[shangpinfenleiIndex]
        if (shangpinfenleiSelectedOption.text != null && shangpinfenleiSelectedOption.text != '') {
            searchForm.shangpinfenlei = "%" + shangpinfenleiSelectedOption.text + "%";
        }
        if ($('#pinpaiSearch').val() != null && $('#pinpaiSearch').val() != '') {
            searchForm.pinpai = "%" + $('#pinpaiSearch').val() + "%";
        }

        if ($('#guigeSearch').val() != null && $('#guigeSearch').val() != '') {
            searchForm.guige = "%" + $('#guigeSearch').val() + "%";
        }

        getDataList();
    }


    /**
     * 上下架修改
     */
    function updateFlag(id,flag){
        let data = {};
        data["id"] = id;
        data["flag"] = flag;
        httpJson("shangpinxinxi/update", "POST", data, (res) => {
            if(res.code == 0){
                alert("修改成功");
            }
            getDataList();
        });
    }


    /**
     * 添加减少库存
     */
    function updateShuliang(){
        var id =$("#updateid").val();
        var flag =$("#flag").val();
        var s = $("#shuliang").val();
        if(s ==null || s=="" || s=="null" || s==0){
            alert("请输入数量");
            return false;
        }
        var o;
        // 查询   查询出这条商品的数量
        http("shangpinxinxi/info/"+id, "GET",null, (res) => {
            if(res.code == 0){
                o = res.data.shuliang;
            }else{
                o = 0;
            }
        });
        var oldShuliang = parseInt(o);
        var i = parseInt(s);
        //计算数量
        var shuliang;
        var smg="";
        if(flag ==2){
            shuliang=oldShuliang-i;//flag为2就是减少库存,在前面加负号
            smg="发货成功";
        }else if(flag ==1){
            shuliang=oldShuliang+i;
            smg="入库成功";
        }
        let data = {};
        data["id"] = id;
        data["shuliang"] = shuliang;
        //保存数据
        httpJson("shangpinxinxi/update", "POST", data, (res) => {
            if(res.code == 0){
                alert(smg);
            }else{
                alert("未知错误,请联系管理员");
            }
            $('#myModal').modal('hide'); //弹出框关闭
            getDataList();
        });
    }

    // id为myModal的模态框关闭的时候会执行这个方法, 方法内容就是把数量框清空
    $('#myModal').on('hide.bs.modal', function () {
        $("#shuliang").val(0);
    })
    /**
     * 修改库存标记,用于标识是添加库存还是删减库存
     */
    function updateShuliangFlag(id,flag){
       $("#flag").val(flag);
       $("#updateid").val(id);
    }

    // 获取数据列表
    function getDataList() {
        http("shangpinxinxi/page", "GET", {
            page: pageIndex,
            limit: pageSize,
            sort: sortColumn,
            order: sortOrder,
            shangpinmingcheng: searchForm.shangpinmingcheng,
            shangpinfenlei: searchForm.shangpinfenlei,
            pinpai: searchForm.pinpai,
            guige: searchForm.guige,
        }, (res) => {
            if(res.code == 0
    )
        {
            clear();
            dataList = res.data.list;
            totalPage = res.data.totalPage;
            //var tbody = document.getElementById('tbMain');
            for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                $('tbody').append(trow);
            }
            pagination(); //渲染翻页组件
            getRoleButtons();// 权限按钮控制
        }
    })
        ;
    }

    // 渲染表格数据
    function setDataRow(item, number) {
        //创建行 
        var row = document.createElement('tr');
        row.setAttribute('class', 'useOnce');
        //创建勾选框
        var checkbox = document.createElement('td');
        var checkboxDiv = document.createElement('div');
        checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
        var checkboxInput = document.createElement('input');
        checkboxInput.setAttribute("class", "custom-control-input");
        checkboxInput.setAttribute("type", "checkbox");
        checkboxInput.setAttribute('name', 'chk');
        checkboxInput.setAttribute('value', item.id);
        checkboxInput.setAttribute("id", number);
        checkboxDiv.appendChild(checkboxInput);
        var checkboxLabel = document.createElement('label');
        checkboxLabel.setAttribute("class", "custom-control-label");
        checkboxLabel.setAttribute("for", number);
        checkboxDiv.appendChild(checkboxLabel);
        checkbox.appendChild(checkboxDiv);
        row.appendChild(checkbox)

        var shangpinbianhaoCell = document.createElement('td');

        shangpinbianhaoCell.innerHTML = item.shangpinbianhao;


        row.appendChild(shangpinbianhaoCell);
        var shangpinmingchengCell = document.createElement('td');

        shangpinmingchengCell.innerHTML = item.shangpinmingcheng;


        row.appendChild(shangpinmingchengCell);
        var shangpinfenleiCell = document.createElement('td');

        shangpinfenleiCell.innerHTML = item.shangpinfenlei;

        row.appendChild(shangpinfenleiCell);
        var shuliangCell = document.createElement('td');

        shuliangCell.innerHTML = item.shuliang;


        row.appendChild(shuliangCell);
        var pinpaiCell = document.createElement('td');

        pinpaiCell.innerHTML = item.pinpai;


        row.appendChild(pinpaiCell);
        var guigeCell = document.createElement('td');

        guigeCell.innerHTML = item.guige;


        row.appendChild(guigeCell);
        var xiangqingCell = document.createElement('td');

        //如果图文详情包含图片
        if (item.xiangqing && item.xiangqing.indexOf('img') != -1) {
            //暂时只考虑图片+文字 和 文字+图片的情况
            var beginIndex = item.xiangqing.indexOf('<img');
            var endIndex = item.xiangqing.indexOf('>');
            xiangqingCell.innerHTML = item.xiangqing.substring(beginIndex, endIndex + 1).replace("img", "img width='100' height='100'");
        } else {
            if (item.xiangqing != null && item.xiangqing != "" && item.xiangqing.length >= 11) {
                xiangqingCell.innerHTML = item.xiangqing.substring(0, 10) + "...";
            } else {
                xiangqingCell.innerHTML = item.xiangqing;
            }
        }


        row.appendChild(xiangqingCell);
        var fengmianCell = document.createElement('td');

        var fengmianImg = document.createElement('img');
        fengmianImg.setAttribute('src', item.fengmian);
        fengmianImg.setAttribute('height', 100);
        fengmianImg.setAttribute('width', 100);
        fengmianCell.appendChild(fengmianImg);


        row.appendChild(fengmianCell);
        var clicktimeCell = document.createElement('td');

        clicktimeCell.innerHTML = item.clicktime;


        var clicknumCell = document.createElement('td');


        //原价
        var priceCell = document.createElement('td');

        priceCell.innerHTML = item.price;


        row.appendChild(priceCell);



        //折扣价
        var discountPriceCell = document.createElement('td');

        discountPriceCell.innerHTML = item.discountprice;


        row.appendChild(discountPriceCell);
        //上下架
        var flagCell = document.createElement('td');

        var temp =null;
        var temp1 =null;

        if(item.flag == 1){
            temp1="下架";
            flagCell.innerHTML ="上架";
            temp=2;
        }else if(item.flag == 2){
            flagCell.innerHTML ="下架";
            temp1="上架";
            temp=1;
        }else{
            //走到这里就说明逻辑有问题
            flagCell.innerHTML ="未知";
            temp1="未知";
            temp=99;
        }


        row.appendChild(flagCell);

        //每行按钮
        var btnGroup = document.createElement('td');

        //详情按钮
        var detailBtn = document.createElement('button');
        var detailAttr = "detail(" + item.id + ')';
        detailBtn.setAttribute("type", "button");
        detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
        detailBtn.setAttribute("onclick", detailAttr);
        detailBtn.innerHTML = "查看"
        btnGroup.appendChild(detailBtn)
        //修改按钮
        var editBtn = document.createElement('button');
        var editAttr = 'edit(' + item.id + ')';
        editBtn.setAttribute("type", "button");
        editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
        editBtn.setAttribute("onclick", editAttr);
        editBtn.innerHTML = "修改"
        btnGroup.appendChild(editBtn)

        //上架 下架
        var flagBtn = document.createElement('button');
        var editAttr = 'updateFlag(' +  item.id + ',' + temp + ')';
        flagBtn.setAttribute("type", "button");
        flagBtn.setAttribute("class", "btn btn-warning btn-sm");
        flagBtn.setAttribute("onclick", editAttr);
        flagBtn.innerHTML = temp1;
        btnGroup.appendChild(flagBtn)


        //添加库存
        var addBtn = document.createElement('button');
        var addAttr = 'updateShuliangFlag(' +  item.id + ','+1+')';
        addBtn.setAttribute("type", "button");
        addBtn.setAttribute("class", "btn btn-primary  btn-sm");
        addBtn.setAttribute("data-toggle", "modal");
        addBtn.setAttribute("data-target", "#myModal");
        addBtn.setAttribute("onclick", addAttr);
        addBtn.innerHTML = "添加库存";
        btnGroup.appendChild(addBtn)
        //减少库存
        var reduceBtn = document.createElement('button');
        var reduceAttr = 'updateShuliangFlag(' +  item.id +','+2+')';
        reduceBtn.setAttribute("type", "button");
        reduceBtn.setAttribute("class", "btn btn-primary  btn-sm");
        reduceBtn.setAttribute("data-toggle", "modal");
        reduceBtn.setAttribute("data-target", "#myModal");
        reduceBtn.setAttribute("onclick", reduceAttr);
        reduceBtn.innerHTML = "减少库存";
        btnGroup.appendChild(reduceBtn)

        //删除按钮
        var deleteBtn = document.createElement('button');
        var deleteAttr = 'remove(' + item.id + ')';
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick", deleteAttr);
        deleteBtn.innerHTML = "删除"
        btnGroup.appendChild(deleteBtn)

        row.appendChild(btnGroup)
        return row;
    }

    // 翻页
    function pageNumChange(val) {
        if (val == 'pre') {
            pageIndex--;
        } else if (val == 'next') {
            pageIndex++;
        } else {
            pageIndex = val;
        }
        getDataList();
    }

    // 下载
    function download(url) {
        window.open(url);
    }

    // 打开新窗口播放媒体
    function mediaPlay(url) {
        window.open(url);
    }

    // 渲染翻页组件
    function pagination() {
        var beginIndex = pageIndex;
        var endIndex = pageIndex;
        var point = 4;
        //计算页码
        for (var i = 0; i < 3; i++) {
            if (endIndex == totalPage) {
                break;
            }
            endIndex++;
            point--;
        }
        for (var i = 0; i < 3; i++) {
            if (beginIndex == 1) {
                break;
            }
            beginIndex--;
            point--;
        }
        if (point > 0) {
            while (point > 0) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            while (point > 0) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--
            }
        }
        // 是否显示 前一页 按钮
        if (pageIndex > 1) {
            $('#tableId_previous').show();
        } else {
            $('#tableId_previous').hide();
        }
        // 渲染页码按钮
        for (var i = beginIndex; i <= endIndex; i++) {
            var pageNum = document.createElement('li');
            pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
            if (pageIndex == i) {
                pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
            } else {
                pageNum.setAttribute('class', 'paginate_button page-item useOnce');
            }
            var pageHref = document.createElement('a');
            pageHref.setAttribute('class', 'page-link');
            pageHref.setAttribute('href', '#');
            pageHref.setAttribute('aria-controls', 'tableId');
            pageHref.setAttribute('data-dt-idx', i);
            pageHref.setAttribute('tabindex', 0);
            pageHref.innerHTML = i;
            pageNum.appendChild(pageHref);
            $('#tableId_next').before(pageNum);
        }
        // 是否显示 下一页 按钮
        if (pageIndex < totalPage) {
            $('#tableId_next').show();
            $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
        } else {
            $('#tableId_next').hide();
        }
        var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
        $('#tableId_info').html(pageNumInfo);
    }

    // 跳转到指定页
    function toThatPage() {
        //var index = document.getElementById('pageIndexInput').value;
        if (index < 0 || index > totalPage) {
            alert('请输入正确的页码');
        } else {
            pageNumChange(index);
        }
    }

    // 全选/全不选
    function chooseAll() {
        checkAll = !checkAll;
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            boxs[i].checked = checkAll;
        }
    }

    // 批量删除
    function deleteMore() {
        ids = []
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            if (boxs[i].checked) {
                ids.push(boxs[i].value)
            }
        }
        if (ids.length == 0) {
            alert('请勾选要删除的记录');
        } else {
            remove(ids);
        }
    }

    // 删除
    function remove(id) {
        var mymessage = confirm("真的要删除吗？");
        if (mymessage == true) {
            var paramArray = [];
            if (id == ids) {
                paramArray = id;
            } else {
                paramArray.push(id);
            }
            httpJson("shangpinxinxi/delete", "POST", paramArray, (res) => {
                if(res.code == 0
        )
            {
                getDataList();
                alert('删除成功');
            }
        })
            ;
        }
        else {
            alert("已取消操作");
        }
    }

    // 用户登出
    <%@ include file="../../static/logout.jsp"%>

    //修改
    function edit(id) {
        window.sessionStorage.setItem('id', id)
        window.location.href = "add-or-update.jsp"
    }

    //清除会重复渲染的节点
    function clear() {
        var elements = document.getElementsByClassName('useOnce');
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    //添加
    function add() {
        window.location.href = "add-or-update.jsp"
    }

    //单列求和
    function getSum(colName) {
        http("shangpinxinxi" + colName, "GET", {
            tableName: "shangpinxinxi",
            columnName: colName
        }, (res) => {
            if(res.code == 0
    )
        {
            return res.data.sum;
        }
    })
        ;
    }

    // 查看详情
    function detail(id) {
        window.sessionStorage.setItem("id", id);
        //window.sessionStorage.setItem("ifView", true);
        window.location.href = "info.jsp";
    }

    function shangpinfenleiSelect() {
        //填充下拉框选项
        http("option/shangpinfenlei/shangpinfenlei", "GET", {}, (res) => {
            if(res.code == 0
    )
        {
            shangpinfenleiOptions = res.data;
            var nullOption = document.createElement('option');
            var shangpinfenleiSelect = document.getElementById('shangpinfenleiSelect');
            shangpinfenleiSelect.appendChild(nullOption);
            for (var i = 0; i < shangpinfenleiOptions.length; i++) {
                var shangpinfenleiOption = document.createElement('option');
                shangpinfenleiOption.setAttribute('name', 'shangpinfenleiOption');
                shangpinfenleiOption.setAttribute('value', shangpinfenleiOptions[i]);
                shangpinfenleiOption.innerHTML = shangpinfenleiOptions[i];
                shangpinfenleiSelect.appendChild(shangpinfenleiOption);
            }
        }
    })
        ;
    }

    //跨表
    function crossTable(id, crossTableName) {
        window.sessionStorage.setItem('crossTableId', id);
        window.sessionStorage.setItem('crossTableName', "shangpinxinxi");
        var url = "../" + crossTableName + "/add-or-update.jsp";
        window.location.href = url;
    }


    $(document).ready(function () {
        //激活翻页按钮
        $('#tableId_previous').attr('class', 'paginate_button page-item previous')
        $('#tableId_next').attr('class', 'paginate_button page-item next')
        //隐藏原生搜索框
        $('#tableId_filter').hide()
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        setMenu();
        init();
        getDataList();
        <%@ include file="../../static/myInfo.js"%>
        shangpinfenleiSelect();
    });
</script>
</body>

</html>
