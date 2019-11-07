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
    <div class="grid row" >
        <div v-if ="bookInuses!=null||bookInuses!='' " class="col-md-6 col-lg-3 grid-item" v-for="(bookInuse,index) in bookInuses">
                <div class="box-masonry"> <a v-bind:href=url+bookInuse.bookRes.isbn title="" class="box-masonry-image with-hover-overlay"><img v-bind:src="path+bookInuse.bookRes.image" alt="" class="img-fluid"></a>
                    <div class="box-masonry-hover-text-header"> <a v-bind:href=url+bookInuse.bookRes.isbn class="tile-link">  </a>
                        <h4>{{bookInuse.bookRes.bname}}</h4>
                        <div class="box-masonry-desription">
                            <p> {{bookInuse.bookRes.introduce}}</p>
                        </div>
                    </div>
                </div>
    </div>
        <div class="col-md-6 col-lg-3 grid-item" >
            <div class="box-masonry"> <a href="addComment.jsp" title="" class="box-masonry-image with-hover-overlay whiadd" style="text-align: center"><img src="img/icons8-plus-math-100.png" class="img-fluid"></a>
                <div class="box-masonry-hover-text-header"> <a href="addComment.jsp" class="tile-link">  </a>
                    <div class="box-masonry-desription" style="text-align: center;">
                        <p style="margin-top: 50px;font-weight: bolder;font-size: larger">添加帖子</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-8">
    <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
    </zpagenav>
</div>
</div>
${sessionScope.rid}
</body>
<script>
    var vue=new Vue({
        el:'#myVue',
        data:{
            bookInuses:"",
            path:'http://localhost:9090/uploads/',
            url:"${request.getContextPath()}/comment/showAllComments?isbn=",
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
                    url: "${request.getContextPath()}bookInuse/showAllBooks",
                    data: {page:page},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        console.log(res);
                        that.total = res.total;
                        that.pageSize = res.pageSize;
                        that.maxPage = res.pages;
                        that.$data.bookInuses="";
                        that.$data.bookInuses = res.list;
                        $('.img-fluid').imagesLoaded(function() {

                            $('.grid').masonry({

                                itemSelector: '.grid-item',
                                columnWidth: 50,

                            });

                        });
                    }
                })
            }
        },
        created:function () {
            this.pageHandler(1);
        },
    })

</script>
</html>
