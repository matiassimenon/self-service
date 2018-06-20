<%-- 
    Document   : loginForm
    Created on : Jan 19, 2018, 11:53:44 AM
    Author     : francisco
--%>
 <%@include file="left.jsp"%>
                    <div class="col-lg-8 py-4 d-flex flex-column align-items-center justify-content-top align-content-center">
                        
                        <div class="login-form w-lg-50">
                            <p class="display-4 accent mb-5">
                            <div class="blog-post-nav mb-3">
                                
                                <a href="register.jsp">     <img src="add_account.png"></img> Sign Up with your Talend Email</a></div>
                            <hr class="mb-5"><h1 class="display-4 accent mb-5"><font color="green">Login </font></h1>
                            <form action="LoginServlet" method="post"  class="cozy" >
                                <div class="form-group control">
                                    <label class="col-mb-5 control-label">Username</label><input type="text" id="login_username"  name= "username" class="form-control" required="required">
                                </div>
                                <div class="form-group control">
                                    <label class="col-mb-5 control-label">Password</label><input type="password" name="password" id="login_password" class="form-control" required="required" ></div>
                                    <div class="d-flex align-content-left justify-content-left" >
                                    <button type="submit" class="btn-lg btn-success">Login</button>
                                    <p><a href="forgotPasswd1.jsp">&nbsp; Forgot Password?</a> </p> 
                                    
                                </div>
                                <div class="d-flex align-content-left justify-content-left">
                                    <%if (errMessage != null) {%><div style="color: red"><%=errMessage%></div><%}%>
                                </div>
                            </form> 
                        </div></div>
                   </div></div>        
        </main>

        
    </body>

</html>
