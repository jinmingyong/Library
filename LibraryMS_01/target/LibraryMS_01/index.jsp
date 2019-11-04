<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/10/26
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>

    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
<%--    <script src="js/vue.js" type="text/javascript"></script>--%>
</head>
<body>
<div id="myVue">
<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body">
                <form id="from1">
                    bname:<input type="text" name="bname" v-model="bookres.bname">
                    isbn:<input type="text" name="isbn"  v-model="bookres.isbn">
                    btype:<select name="btype" v-model="bookres.btype">
                    <option value="1">拉拉</option>
                    <option value="2">jjj</option>
                </select>
                    author:<input type="text" name="author" v-model="bookres.author">
                    publisher:<input type="text" name="publisher" v-model="bookres.publisher">
                    <%--    import_time<input type="date" name="importTime">--%>
                    amount:<input type="text" name="amount" v-model="bookres.amount">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" @click="confim()" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</div>

<a href="bookres/findAllBookRes">查询所有</a>
</body>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/vue.js"></script>
<script>
   new Vue({
        el:'#myVue',
       data:{
           bookres:{bname:'',bookres:'',btype:'1',author:'',publisher:'',amount:''},
           bookResList:[],
           ids:[],
       },
        methods:{
            confim:function() {
                var flag= confirm("是否继续")
                if(flag==true){
                    this.addlist();
                    document.getElementById("from1").reset();//重置表单
                }
                else {
                    this.addlist();
                    console.log(this.bookResList);
                    $.ajax({
                        //编写json格式，设置属性和值
                        url:"bookres/addBookRes",
                        contentType:"application/json;charset=UTF-8",
                        data:JSON.stringify(this.bookResList),
                        dataType:"json",
                        type:"post",
                        success:function (data) {
                            console.log(data);
                             $("#myModal").trigger("click");
                            window.location.href="bookres/findAllBookRes"
                        }
                    })
                }
                //$("#from1").submit();
            },
            addlist:function () {
                this.bookResList.push(this.bookres);
                console.log(this.bookResList);
                this.bookres={bname:'',bookres:'',btype:'1',author:'',publisher:'',amount:''}
            },
            dele:function () {

            }
        }
    })

</script>
</html>
