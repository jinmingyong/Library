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
    </div>
    <div class="col-lg-8">
        <div class="content-column-content">

            <div class="commentAll">
                <div class="col-lg-10">
                    <div class="card mb-lg-5">
                        <div class="card-header">
                            <div class="card-body" style="padding: 10px 0 0 20px"><h3 style="margin: 0">标题：{{comment.title}}</h3></div>
                            <div class="comment-show-con clearfix">
                                <div class="comment-show-con-img pull-left"><img :src="path+comment.reader.image" alt="" class="rounded-circle img-fluid"></div>
                                <div class="comment-show-con-list pull-left clearfix">
                                    <div class="pl-text clearfix">
                                        <a class="comment-size-name" style="font-size: 15px">{{comment.reader.rname}}:</a>
                                        <span class="my-pl-con" style="font-size: 18px">&nbsp;{{comment.context}}<div style="display: inline-block; width: 200px">
                                <img v-if="comment.image!=null" :src="'http://localhost:9090/uploads/'+comment.image" alt="" class=" img-fluid" style="height: 300px;width: 200px;">
                                            </div></span>
                                    </div>
                                    <div class="date-dz">
                                        <span class="date-dz-left pull-left comment-time">{{comment.comCreatetime}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <%--  <h3 >{{comment.title}}</h3>--%>
                   <%--     <div class="text-muted">
                            <div style="display: inline-block; width: 200px">
                                <img v-if="comment.image!=null" :src="'http://localhost:9090/uploads/'+comment.image" alt="" class="img-fluid" style="height: 300px;width: 200px">
                            </div>--%>
                            <div class="card-body">
                              <%--  <p style="margin-bottom: 50px">{{comment.context}}</p>--%>
                                <ul class="comment-show">
                                    <comment-remark v-for="remark in remarks" v-bind:item="remark"></comment-remark>

                                </ul>
                                  <div class="col-lg-10">
                                      <zpagenav v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
                                      </zpagenav>
                                  </div>
                                <div class="reviewArea clearfix">
                                    <textarea class="form-control" placeholder="Please enter a comment&hellip;" v-model="rcontext"></textarea>
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

    </div>
<template id="sonreply">
<div class="hf-list-con" style="margin: 0">
    <div class="all-pl-con">
        <div class="pl-text hfpl-text clearfix">
            <a href="#" class="comment-size-name">{{sonreply.reader.rname}} : </a>
            <span class="my-pl-con">回复<a href="#" class="atName">@{{sonreply.replyname}} </a> : {{sonreply.rcontext}} </span>
            <div class="date-dz">
                <span class="date-dz-left pull-left comment-time">{{sonreply.createtime}}</span>
                <div class="date-dz-right pull-right comment-pl-block" style="padding-top: 12px">
                    <button style="font-size:5px"  @click="deleRemark(sonreply.remId)" v-if="${reader.readId}==sonreply.rid" class="btn btn-sm btn-link"> 删除</button>
                    <button style="font-size:5px"  @click="flag=!flag" class=" btn btn-sm btn-link hf-con-block pl-hf">回复</button>
                </div>
                <reply v-show="flag" :r="sonreply"></reply>
            </div>
        </div>

    </div>
</div>
</template>
<template  id="replyTextarea">
    <div class="hf-con pull-left">
    <textarea class="form-control hf-con hf-input" v-model="rcontext"></textarea>
    <button @click="addRemark()" class="btn btn-group-lg btn-info" style="float: right">评论</button>
    </div>
</template>
<template id="comments" >
    <li class="comment-show-con clearfix">
        <div class="comment-show-con-img pull-left"><img :src="'http://localhost:9090/uploads/'+item.reader.image" alt="" class="rounded-circle img-fluid"></div>
        <div class="comment-show-con-list pull-left clearfix" style="margin-bottom: 20px">
            <div class="pl-text clearfix">
                <a href="#" class="comment-size-name">{{item.reader.rname}}:</a>
                <span class="my-pl-con">&nbsp;{{item.rcontext}}</span>
            </div>
            <div class="date-dz">
                <span class="date-dz-left pull-left comment-time">{{item.createtime}}</span>
                <div class="date-dz-right pull-right comment-pl-block" style="padding-top: 12px">
                    <button style="font-size:5px"  @click="deleRemark(item.remId)" v-if="${reader.readId}==item.rid" class="btn btn-sm btn-link"> 删除</button>
                    <button style="font-size:5px"  @click="flag=!flag" class=" btn btn-sm btn-link hf-con-block pl-hf">回复</button>
                </div>
                <reply v-show="flag" :r="item"></reply>
               <sonreply v-for="sonreply in sonreplys" :sonreply="sonreply"></sonreply>
                <div>
                    <zpagenav v-if="total>=3" v-bind:page="page" v-bind:page-size="pageSize" v-bind:total="total" v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
                    </zpagenav>
                </div>
            </div>

        </div>   <hr style="margin:0;clear: both">
    </li>

</template>
</body>
<script src="js/jquery.flexText.js"></script>
<script>


</script>
<script>
    var reply={
        props:['flag','r'],
        template: '#replyTextarea',
        data:function () {
            return{
                rcontext: '回复@'+this.r.reader.rname+": ",
            }
        },
        methods:{
            addRemark:function(){
                var that=this;
                var rcontext=this.rcontext.substring(this.rcontext.indexOf(":")+1);
                if (rcontext.trim()==""){
                    alert("提交评论不能为空")
                    return
                }
                $.ajax({
                    url: "remark/addRemark",
                    data: {comid:that.r.comid,rcontext:rcontext,rid:${reader.readId},replyname:that.r.reader.rname,fatherremid:that.r.fatherremid==null?that.r.remId:that.r.fatherremid},
                    /* dataType: "json",*/
                    type: "post",
                    success: function (res) {
                        window.location.reload()
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $("#p_test").innerHTML = "there is something wrong!";
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
                })
            },
         /*   deleRemark:function (remId) {
                alert("111")
                this.$emit('deleRemark',remId)
            }*/
        },
    }
    var sonreply={
        props:['sonreply'],
        template:"#sonreply",
        data:function(){
          return{
              flag:false,
          }
        },
        components: {
            reply
        },
        methods:{
            deleRemark:function (remId) {
                this.$parent.deleRemark(remId)
            }
        }
    }
    var commentRemark={
        props:['item','remark'],
        template: '#comments',
        data:function () {
            return{
                sonreplys:"",
                flag: false,
                page:1,  //显示的是哪一页
                pageSize:null, //每一页显示的数据条数
                total:null, //记录总数
                maxPage:null, //最大页数
            }
        },
        watch: {
            item: function(){
                this.flag=false;
                this.pageHandler(1)
            }
        },
        methods:{
            pageHandler: function (page) {
                this.page=page
                var that=this;
                $.ajax({
                    url: "remark/showAllSonRemark",
                    data: {page:page,comid:that.item.comid,faterremid:that.item.remId},
                    dataType: "json",
                    type: "post",
                    success: function (res) {
                        console.log(res);
                        that.total = res.total;
                        that.pageSize = res.pageSize;
                        that.maxPage = res.pages;
                        that.$data.sonreplys= res.list;
                    }
                })
            },
            deleRemark:function (remId) {
                this.$parent.deleRemark(remId)
            }
        },
        mounted:function () {
                this.pageHandler(1);
              console.log(this.item)
        },
        components: {
            reply,
            sonreply
        }
    }
        var vue=new Vue({
            el:'#myVue',
            data:{
                remarks:'',
                comment:${comment},
                path:'http://localhost:9090/uploads/',
                page:1,  //显示的是哪一页
                pageSize:null, //每一页显示的数据条数
                total:null, //记录总数
                maxPage:null, //最大页数
                rcontext:'',
            },
            components:{
                commentRemark
               /* template:"#sonRemark",
                props: ['remark'],
                data: function () {
                    return {commentText: ""}
                },
                methods: {
                    addComment: function () {
                        this.$emit("submit", this.commentText);
                        this.commentText = "";
                    },
                    canelComment: function () {
                        this.$emit("canel");
                        this.commentText = "";
                    }
                }*/
            },
            methods:{
                addRemark:function(){
                    var that=this;
                    if (that.rcontext.trim()==""){
                        alert("提交评论不能为空");
                        return
                    }
                    $.ajax({
                        url: "remark/addRemark",
                        data: {comid:that.comment.comId,rcontext:that.rcontext,rid:${reader.readId}},
                        /* dataType: "json",*/
                        type: "post",
                        success: function (res) {
                            window.location.reload()
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            $("#p_test").innerHTML = "there is something wrong!";
                            alert(XMLHttpRequest.status);
                            alert(XMLHttpRequest.readyState);
                            alert(textStatus);
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
     /*                   dataType: "json",*/
                        type: "post",
                        success: function (res) {
                            window.location.reload()
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
