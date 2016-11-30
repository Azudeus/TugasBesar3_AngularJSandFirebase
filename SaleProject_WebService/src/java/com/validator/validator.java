/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.validator;


import static com.validator.request.executePost;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Rellons
 */
@WebService(serviceName = "validator")
public class validator {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    
    
    public int authToken (String token,String userAgent, String ipAddress){
        String auth;
        String asend = "access_token=";
        asend+=token;
        userAgent = userAgent.replaceAll("\\s","");
        asend+=";";
        asend+=userAgent;
        asend+=";";
        asend+=ipAddress.trim();
        System.out.println(asend);
        auth = executePost("http://localhost:8080/SaleProject_IdentityService/authToken",asend);
        if(auth.trim().equals("True"))
            return 1;
        else
        if(auth.trim().equals("False"))
            return 2;
        else
            return 0;
    }
     
}
