<%-- 
    Document   : forgotPasswd
    Created on : 2018-4-3, 12:54:26
    Author     : aiming
--%>
<%@page import="com.selfservice.model.User"%>
 <%@include file="left.jsp"%>
             <% 
                User user1 = (User)request.getSession(false).getAttribute("resetUser");
            %>   
 <script src="selfservice.js"> </script>
 <div class="col-lg-8 py-4 d-flex flex-column align-items-center justify-content-top align-content-center">
                        <div class="login-form w-lg-50">
                            <p class="display-4 accent mb-5">
                            <h1 class="display-4 accent mb-5"><font color="green">Reset Password </font></h1>
                            <form  action="ForgotPasswdServlet?step=3" method = "post" class="cozy" >
                                <div class="form-group control">
                                    <label class="col-mb-6 control-label">Username</label><input type="text"  id="username" name="username"  readonly value="<%=user1.getUsername()%>" class="form-control">
                                </div>
                                <div class="form-group control">
                                    <label class="col-mb-6 control-label">New password</label><input type="password" id="password1" name="password1" required="required" onkeyup="checkPasswd();" class="form-control">
                                </div>
                                <div class="form-group control">
                                    <label class="col-mb-6 control-label">Retry password</label><input type="password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" class="form-control">
                                </div>
                                <div class="d-flex align-content-left justify-content-left">
                                    <button type="submit" id="submitBtn" class="btn-lg btn-success">Reset</button>
                                    <p><a href="login.jsp">Cancel</a> </p>
                                    
                                    <p id="passwdMsg"></p>
                                    
                                </div>
                                <div class="d-flex align-content-left justify-content-left">
                                    <%if (errMessage != null) {%><h4 style="color: red"><%=errMessage%></h4><%}%>
                                </div>
                            </form> 
                        </div></div>
                   </div></div>        
        </main>

        
    </body>

</html>
            