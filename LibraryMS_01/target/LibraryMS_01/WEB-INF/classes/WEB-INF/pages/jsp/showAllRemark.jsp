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

            <div class="commentAll">
                <div class="col-lg-10">
                    <div class="card mb-auto">
                        <h3 class="card-header">{{comment.title}}</h3>
                        <div class="text-muted">
                            <div style="display: inline-block; width: 200px">
                                <img v-if="comment.image!=null" :src="'http://localhost:9090/uploads/'+comment.image" alt="" class="img-fluid" style="height: 300px;width: 200px">
                            </div>
                            <div class="card-body">
                                <p style="margin-bottom: 50px">{{comment.context}}</p>
                                <div class="comment-show">
                                    <div class="comment-show-con clearfix" v-for="(remark,index) in remarks">
                                        <div class="comment-show-con-img pull-left"><img :src="path+remark.reader.image" alt=""></div>
                                        <div class="comment-show-con-list pull-left clearfix">
                                            <div class="pl-text clearfix">
                                                <a href="#" class="comment-size-name">{{remark.reader.rname}}:</a>
                                                <span class="my-pl-con">&nbsp;{{remark.rcontext}}</span>
                                            </div>
                                            <div class="date-dz">
                                                <span class="date-dz-left pull-left comment-time">{{remark.createtime}}</span>
                                                <div class="date-dz-right pull-right comment-pl-block" style="padding-top: 12px">
                                                    <button style="font-size:5px"  @click="deleRemark(remark.remId)" v-if="${rid}==remark.rid" class="btn btn-sm btn-link"> 删除</button>
                                                    <button style="font-size:5px"  @click="" class=" btn btn-sm btn-link pl-hf">回复</button>
                                                </div>
                                            </div>
                                            <div class="hf-list-con"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="reviewArea clearfix">
                                    <textarea class="form-control" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)" v-model="rcontext"></textarea>
                                    <button v-on:click="addRemark()" class="btn btn-group-lg btn-info" style="float: right">评论</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--评论区域 end-->
                <!--回复区域 begin-->
                <!--评论区域 begin-->
                <!--回复区域 end-->
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
<script src="js/jquery.flexText.js"></script>
<script>
   var vue=new Vue({
        el:'#myVue',
        data:{
            remarks:"",
            comment:${comment},
            path:'http://localhost:9090/uploads/',
            page:1,  //显示的是哪一页
            pageSize:null, //每一页显示的数据条数
            total:null, //记录总数
            maxPage:null, //最大页数
            rcontext:''
        },
        methods:{
            addRemark:function(){
                var that=this;
                $.ajax({
                    url: "remark/addRemark",
                    data: {comid:that.comment.comId,rcontext:that.rcontext,rid:${rid}},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        alert("111")
                        location.reload()
                    }
                })
            },
            pageHandler: function (page) {
                this.page=page
                var that=this;
                $.ajax({
                    url: "remark/showAllRemark",
                    data: {page:page,comId:that.comment.comId},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        console.log(res);
                        that.total = res.total;
                        that.pageSize = res.pageSize;
                        that.maxPage = res.pages;
                        that.$data.remarks = res.list;
                    }
                })
            },
            deleRemark:function(remId){
           var that=this;
           $.ajax({
               url: "remark/deleRemark",
               data: {remId:remId},
               dataType: "json",
               type: "post",
               success: function (res) {
                   location.reload()
               }
           })
       }
       },
            created:function () {
            this.pageHandler(1)
        },
    })

</script>
</html>
