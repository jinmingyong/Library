<!DOCTYPE html>
<html>

<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
        <!--   *** SIDEBAR END ***  -->
        <!--   *** DETAIL ***-->
        <div class="col-md-8 col-lg-9 content-column white-background">
          <div class="row" id="mvVue">
            <div class="col-lg-8">
              <div class="content-column-content">
                <div class="col-lg-10">
                  <div class="jumbotron">
                    <h3>${bookRes.bname}</h3>
                    <div class="comment-body">
                      <div style="display: inline-block; width: 200px">
                        <img src="http://localhost:9090/uploads/${bookRes.image}" alt="" class="img-fluid" style="float:left;height: 300px;width: 200px">
                      </div>
                      <div class="card-body" style="width: 300px;display: inline-block">
                        <p>${bookRes.introduce}</p>
                      </div>
                    </div></div></div>
                <form id="contact-form" method="post" action="comment/addComment?isbn=${bookRes.isbn}&rid=${reader.readId}" class="contact-form form" enctype="multipart/form-data">
                  <div class="controls">
                        <div class="form-group">
                          <label for="title">Title</label>
                          <input type="text" name="title" id="title" required="required" class="form-control">
                        </div>
                    <div class="form-group">
                      <label for="image">image</label>
                      <input type="file" name="upload" id="image" class="form-control-file">
                    </div>
                    <div class="form-group">
                      <label for="context">context</label>
                      <textarea rows="4" name="context" id="context" required="required" class="form-control"></textarea>
                    </div>
                    <div>
                      <input type="submit" value="Send" class="btn btn-outline-primary">
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
</html>