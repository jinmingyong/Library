<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/5
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
/*        .j1{
            position: fixed;top:5%; right: 15px;z-index: 5
        }
        .j2{
            position: fixed;top:5%; right: 15%;z-index: 5
        }*/
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="col-md-8 col-lg-10 content-column" id="myVue">
    <div class="col-md-8 col-lg-8">
        <div class="content-column-content">
            <div class=" flick_button_style style2 pb_50 col-lg-12" style="position: relative">
            <div class="buttons">
            <%--    <button type="button" id="showbtn" data-toggle="offcanvas-right" class="button5 border_color_f9b radius_50 j2"  ><i class="fa fa-search"></i> </button>--%>
        <h3>${reader.rname}</h3>
                <div class="comment-body">
            <div style="display: inline-block; width: 200px">
                <img src="http://localhost:9090/uploads/${reader.image}" alt="" class="img-fluid" style="height: 300px;width: 200px;float: left">
            </div>
                <div class="card-body" style="width: 300px;display: inline-block;">
                    <p>${}</p>
                    <section class="container" style="position: absolute;top: 20px;right: 30px;width: auto">
                        <form onsubmit="submitFn(this, event);">
                            <div class="search-wrapper">
                                <div class="input-holder">
                                    <input type="text" class="search-input" v-model="input_value" placeholder="Type to search" />
                                    <button class=" border_color_f9b radius_50 j2 search-icon" style="background-color: #fac675;" onclick="searchToggle(this, event);"><span><i class="fa fa-search"></i></span></button>
                                </div>
                                <span class="close" onclick="searchToggle(this, event);"></span>
                                <div class="result-container">

                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            </div></div>
            </div>
            <div class="grid row" >
                <div v-if ="comments!=null||comments!='' " class="col-lg-8 col-lg-12 grid-item" v-for="(comment,index) in comments" >
                    <div class="box-masonry"> <a :href="'/comment/findCommentById?comId='+comment.comId" title="" class="box-masonry-image with-hover-overlay" style="width: 20%;display: inline-block;float: left"><img :src="path+comment.image" alt="" class="img-fluid"></a>
                        <div style="padding:2% 23%;"> {{comment.reader.rname}}<a :href="'/comment/findCommentById?comId='+comment.comId" class="tile-link"> </a>
                            <h2 style="margin: 0 ;position: absolute;top: 30%">{{comment.title}}</h2>
                            <div class="box-masonry-desription">
                                <p><span style="position: absolute;right: 1%;bottom: 1%">{{comment.comCreatetime}}</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-lg-12 grid-item">
                    <div class="box-masonry"> <a href="comment/addCommentjsp?bid=${bookRes.bid}" title="" class="box-masonry-image with-hover-overlay whiadd" style="text-align: center"><img src="img/icons8-plus-math-100.png" class="img-fluid"></a>
                        <div class="box-masonry-hover-text-header"> <a href="comment/addCommentjsp?bid=${bookRes.bid}" class="tile-link">  </a>
                            <div class="box-masonry-desription" style="text-align: center;">
                                <p style="margin-top: 50px;font-weight: bolder;font-size: larger">添加帖子</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-lg-12" style="position: relative;bottom: 0">
            <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
            </zpagenav>
        </div>
</div>
</div>
</body>
<script>
    function searchToggle(obj, evt){

            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
      /*          $('.row-offcanvasright').toggleClass('active')*/
                container.addClass('active');
                evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
               /* $('.row-offcanvasright').toggleClass('active')*/
                container.removeClass('active');
                // clear input
               /* container.find('.search-input').val('');*/
                // clear and hide result container when we press close
                container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }
        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "Yup yup! Add some text friend :D";
            }
            else{
                _html += "<b>" + value + "</b>";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
</script>
<script>
    var vue=new Vue({
        el:'#myVue',
        data:{
            comments:${comments},
            path:'http://localhost:9090/uploads/',
            page:1,  //显示的是哪一页
            pageSize:null, //每一页显示的数据条数
            total:null, //记录总数
            maxPage:null, //最大页数
            images:{},
            input_value:'',
        },
        watch:{
            input_value: function () {
                this.debounce(this.pageHandler, 1000)
            }
        },
        methods:{
            debounce: function (fn, wait) {
                if (this.fun !== null) {
                    console.log("---------")
                    clearTimeout(this.fun)
                }
                this.fun = setTimeout(fn, wait)
            },
            showMoreBorrow:function () {
                var that=this;
                $.ajax({
                    url: "bookBorrow/moreBorrow",
                    data: "",
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        that.images=res;
                        $.getScript("js/myjs.js")
                    }
                })
            },
            pageHandler:function(page){
                var that=this;
                $.ajax({
                    url: "comment/findCommentByTitle",
                    data: {title:this.input_value.trim(),pageNum:page==null?1:page,isbn:${isbn}},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        that.page=page;
                        that.total = res.total;
                        that.pageSize = res.pageSize;
                        that.maxPage = res.pages;
                        that.comments=res.list;
                    }
                })
        },
        },
      /*  created:function () {
            var $grid = $('.grid').imagesLoaded( function() {
                // init Masonry after all images have loaded
                $grid.masonry({
                    itemSelector: '.grid-item',
                    // use element for option
                });
            });
        /!*    $grid.progress( function() {
                $grid.masonry('layout');
            });*!/
        },*/
        mounted:function () {
            this.pageHandler(1);
            this.showMoreBorrow();
        }
    });
</script>
</html>
