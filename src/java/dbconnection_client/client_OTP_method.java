/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection_client;

import dbConnection.dbConnectionFile;
import java.util.Random;

/**
 *
 * @author bharat
 */
public class client_OTP_method extends dbConnectionFile{
   public String generate_otp(){ 
       int randomPIN = (int)(Math.random()*9000)+1000;
        String val = ""+randomPIN;
        return val.toString();
    }
   public String generate_password(){ 
       Random r=new Random();
       int n =100000+r.nextInt(900000);
        String val = ""+n;
        return val.toString();
    }
}
