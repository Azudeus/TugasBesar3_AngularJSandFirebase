<%-- 
    Document   : connector
    Created on : Nov 13, 2016, 10:29:49 AM
    Author     : Personal
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
  public boolean isInteger(String str) {
    try {
        Integer.parseInt(str);
        return true;
    } catch (NumberFormatException nfe) {}
    return false;
}%>
<html>
    <title>
      <%@include file="request.jsp"%>
    </title>
    <body>
    
    <%
      Enumeration parameterList = request.getParameterNames();
      String psend = "";
      String type = request.getParameter(parameterList.nextElement().toString());
      String accesstoken = "";
      while( parameterList.hasMoreElements() )
      {
        String sName = parameterList.nextElement().toString();
        psend+=sName;
        psend+="=";
        psend+=request.getParameter(sName);
        if(sName.equals("access_token"))
            accesstoken = request.getParameter(sName);
        if(parameterList.hasMoreElements()){
            psend+="&";
        }
      }
      String x;
      if (type.equals("login")){
        x = executePost("http://localhost:8080/SaleProject_IdentityService/LoginServlet",psend);
        JSONObject jObject = new JSONObject(x);
        x = jObject.get("id").toString();
        if(isInteger(x)) {          
            session.setAttribute("account_id",x);
            String y = jObject.get("username").toString();
            session.setAttribute("username",y);
            String tsend = "account_id=";
            tsend+=x.trim();
            
            tsend+="&user_agent=";
            String userAgent = request.getHeader("User-Agent");
            userAgent = userAgent.replaceAll("\\s","");
            out.println(userAgent);
            tsend+=userAgent;
            tsend+="&ip_address=";
            String ipAddress = request.getRemoteAddr();
            tsend+=ipAddress;
            
            String token = executePost("http://localhost:8080/SaleProject_IdentityService/getToken",tsend);
            session.setAttribute("token",token.trim());
            response.sendRedirect("catalog.jsp");
        }
      } else if (type.equals("register")) {
            x = executePost("http://localhost:8080/SaleProject_IdentityService/RegisterServlet",psend);
            JSONObject jObject = new JSONObject(x);
            x = jObject.get("id").toString();
            if(isInteger(x)) {
                session.setAttribute("account_id", x);
                String y = jObject.get("username").toString();
                session.setAttribute("username",y);
                String tsend = "account_id=";
                tsend+=x.trim();
                
                tsend+="&user_agent=";
                String userAgent = request.getHeader("User-Agent");
                userAgent = userAgent.replaceAll("\\s","");
                tsend+=userAgent;
                tsend+="&ip_address=";
                String ipAddress = request.getRemoteAddr();
                tsend+=ipAddress;
                
                String token = executePost("http://localhost:8080/SaleProject_IdentityService/getToken",tsend);
                session.setAttribute("token",token.trim());
                response.sendRedirect("catalog.jsp");
            }
      } else if (type.equals("logout")){
            psend+=";";
            String userAgent = request.getHeader("User-Agent");
            userAgent = userAgent.replaceAll("\\s","");
            psend+=userAgent;
            psend+=";";
            String ipAddress = request.getRemoteAddr();
            psend+=ipAddress;
            out.println(psend);

            x = executePost("http://localhost:8080/SaleProject_IdentityService/LogoutServlet",psend);
          String username = request.getParameter("username").toString();
          String tsend = "username=";
          tsend+=username;
          out.println(x.trim());
          String y = executePost("http://localhost:8080/SaleProject_ChatService/deleteInfo",tsend);
          if((Integer.parseInt(x.trim())==1)&&(Integer.parseInt(y.trim())==1)) {
               response.sendRedirect("login.jsp");             
           }else{
               out.println("Error");
           }
      } else if (type.equals("send_token")) {
          x = executePost("http://localhost:8080/SaleProject_ChatService/sendInfo",psend);
         
//          response.sendRedirect("catalog.jsp");
      } else if (type.equals("send_message")) {
          x = executePost("http://localhost:8080/SaleProject_ChatService/sendMessageServlet",psend);
           out.println(psend);
          //response.sendRedirect("catalog.jsp");          
      }else if(type.equals("auth_token")){
          x = executePost("http://localhost:8080/SaleProject_IdentityService/authToken",psend);
          out.println(psend);
         // out.println(accesstoken);
         // out.println(x);
          if(x.trim().equals("False")){
            out.println("<script>alert('token sudah kadaluarsa');</script> ");
            out.println("<form method='post' action='connector.jsp' id='formLogout'>");
                out.println("<input type='hidden' name='title' value='logout'>");
                out.println("<input type='hidden' name='access_token' value="+ accesstoken +">");
            out.println("</form>");
            out.println("<script>document.forms['formLogout'].submit();</script>"); 
        }
      
      }
      else {
          out.println("notfound");
      }
              
    %>
</body>
</html>

