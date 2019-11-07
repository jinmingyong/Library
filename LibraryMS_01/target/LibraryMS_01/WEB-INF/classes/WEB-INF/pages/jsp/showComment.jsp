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
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="col-md-8 col-lg-9 content-column" id="myVue">
    <div class="small-navbar d-flex d-md-none">
        <button type="button" data-toggle="offcanvas" class="btn btn-outline-primary"> <i class="fa fa-align-left mr-2"></i>Menu</button>
        <h1 class="small-navbar-heading"> <a href="index.jsp">Creative </a></h1>
    </div>
    <div class="col-lg-8">
        <div class="content-column-content">
            <div class="col-lg-10">
            <div class="jumbotron">
        <h3>${bookRes.bname}</h3>
                <div class="comment-body">
            <div style="display: inline-block; width: 200px">
                <img src="http://localhost:9090/uploads/${bookRes.image}" alt="" class="img-fluid" style="height: 300px;width: 200px">
            </div>
                <div class="card-body" style="width: 300px;display: inline-block">
                    <p>${bookRes.introduce}</p>
                </div>
            </div></div></div>
            <div class="grid row" >
                <div v-if ="comments!=null||comments!='' " class="col-lg-10 col-lg-10 grid-item" v-for="(comment,index) in comments" >
                    <div class="box-masonry"> <a :href="'/comment/findCommentById?comId='+comment.comId" title="" class="box-masonry-image with-hover-overlay" style="width: 20%;display: inline-block;float: left"><img :src="path+comment.image" alt="" class="img-fluid"></a>
                        <div style="padding:2% 23%;"> {{comment.reader.rname}}<a :href="'/comment/findCommentById?comId='+comment.comId" class="tile-link"> </a>
                            <h2 style="margin: 0 ;position: absolute;top: 30%">{{comment.title}}</h2>
                            <div class="box-masonry-desription">
                                <p><span style="position: absolute;right: 1%;bottom: 1%">{{comment.comCreatetime}}</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10 col-lg-10 grid-item">
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
        <div class="col-lg-10">
            <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
            </zpagenav>
        </div>
    </div>
    <h4>You can find me also on:</h4>
    <p class="social social--big"><a href="#" title="" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" title="" class="twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="gplus"><i class="fa fa-google-plus"></i></a><a href="#" title="" class="instagram"><i class="fa fa-instagram"></i></a><a href="#" title="" class="email"><i class="fa fa-envelope"></i></a></p>
</div>
</body>
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
        },
        methods:{
            pageHandler: function (page) {
                this.page=page
                var that=this;
                $.ajax({
                    url: "comment/showAllComments2",
                    data: {page:page,isbn:${isbn}},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        console.log(res);
                        that.total = res.total;
                        that.pageSize = res.pageSize;
                        that.maxPage = res.pages;
                        that.$data.comments = res.list;
                    }
                })
            }
        },
        created:function () {
            this.pageHandler(1)
        },
        mounted:function () {
            $.getScript("js/front.js")
        }
    })

</script>
</html>
