<!DOCTYPE html>
<html>

<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
        <!--   *** SIDEBAR END ***  -->
        <!--   *** DETAIL ***-->
        <div class="col-md-8 col-lg-10 content-column white-background">
          <div class="row" id="mvVue">
            <div class="content-column-content" style="overflow: hidden">
              <div class="col-lg-12" style="position: relative">
                <h3 class="card-header">${bookRes.bname}</h3>
                <div class="comment-body">
                  <div style="display: inline-block; width: 200px;float: left">
                    <img src="http://localhost:9090/uploads/${bookRes.image}" alt="" class="" style="height: 300px;width: 200px;float: left">
                  </div>
                  <div class="card-body" style="width: 400px;display: inline-block;float: left">
                    <p style="font-size: 15px">${bookRes.introduce}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
                <form id="contact-form" method="post" action="comment/addComment?isbn=${bookRes.isbn}&rid=${reader.readId}" class="contact-form form" enctype="multipart/form-data">
                  <div class="controls">
                        <div class="form-group">
                          <label for="title">标题</label>
                          <input type="text" name="title" id="title" required="required" class="form-control">
                        </div>
                    <div class="form-group">
                      <label for="image">图片</label>
                      <input type="file" name="upload" id="image" class="form-control-file" onchange="uploadImg()">
                    </div>
                    <div class="form-group">
                      <label for="context">内容</label>
                      <textarea rows="4" name="context" id="context" required="required" class="form-control"></textarea>
                    </div>
                    <div>
                      <input type="submit" value="发送" class="btn btn-outline-primary">
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script>
    function uploadImg() {
      var _name, _fileName, personsFile;
      personsFile = document.getElementById("image");
      _name = personsFile.value;
      _fileName = _name.substring(_name.lastIndexOf(".") + 1).toLowerCase();
      if (_fileName !== "png" && _fileName !== "jpg" &&_fileName !== "gif") {
        personsFile.value="";
        Swal.fire({
          icon: 'error',
          title: '请求出错!',
          text: '图片格式错误',
        });

        return
      }
    }
</script>
</html>