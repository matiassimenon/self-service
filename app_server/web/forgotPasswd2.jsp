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
 
 <div class="col-lg-8 py-4 d-flex flex-column align-items-center justify-content-top align-content-center">
                        <div class="login-form w-lg-50">
                            <p class="display-4 accent mb-5">
                            <h1 class="display-4 accent mb-5"><font color="green">Reset Password:</font></h1>
                            <form  action="ForgotPasswdServlet?step=2" method = "post" class="cozy" >
                                <div class="form-group control">
                                    <label class="col-mb-6 control-label">Question</label><input type="text"  id="question" readonly name="question"  required="required" value="<%=user1.getQuestion()%>" class="form-control">
                                </div>
                                <div class="form-group control">
                                    <label class="col-mb-6 control-label">Answer</label><input type="text"  id="answer" name="answer"  required="required" class="form-control">
                                </div>
                                <div class="d-flex align-content-left justify-content-left">
                                    <button type="submit" class="btn-lg btn-success">Next</button>
                                    <p><a href="login.jsp"> &nbsp; Login</a> </p> 
                                    
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
            