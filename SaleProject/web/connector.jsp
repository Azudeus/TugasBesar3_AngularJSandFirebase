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
      
      while( parameterList.hasMoreElements() )
      {
        String sName = parameterList.nextElement().toString();
        psend+=sName;
        psend+="=";
        psend+= request.getParameter(sName);
        if(parameterList.hasMoreElements()){
            psend+="&";
        }
      }
      String x;
      psend+="&user_agent=";
      String userAgent = request.getHeader("User-Agent");
      psend+=userAgent;
      psend+="&ip_address=";
      String ipAddress = request.getRemoteAddr();
      psend+=ipAddress;
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
                String token = executePost("http://localhost:8080/SaleProject_IdentityService/getToken",tsend);
                session.setAttribute("token",token.trim());
                response.sendRedirect("catalog.jsp");
            }
      } else if (type.equals("logout")){
          x = executePost("http://localhost:8080/SaleProject_IdentityService/LogoutServlet",psend);
          out.println(psend); 
           if(Integer.parseInt(x.trim())==1){
               response.sendRedirect("login.jsp");             
           }else{
               out.println("Error");
           }
      } else if (type.equals("send_token")) {
          x = executePost("http://localhost:8080/SaleProject_ChatService/sendInfo",psend);
          response.sendRedirect("catalog.jsp");
      } else if (type.equals("send_message")) {
          x = executePost("http://localhost:8080/SaleProject_ChatService/sendMessageServlet",psend);
          response.sendRedirect("catalog.jsp");          
      }else {
          out.println("notfound");
      }
              
    %>
</body>
</html>

