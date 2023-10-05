package com.udanchoo.intranet.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



@Repository
public class UCILoginDAO {

     @Autowired
     private JdbcTemplate jdbcTemplate;

     private static final String SQL = "select * from tbusermaster";

     /*
     public List<UCIUser> isData() {

          List<UCIUser> listUsers = new ArrayList<UCIUser>();
          List<Map<String, Object>> rows = jdbcTemplate.queryForList(SQL);

          for (Map<String, Object> row : rows) 
          {
        	  UCIUser user = new UCIUser();
        	  user.setUserId((String)row.get("userid"));
        	  user.setUserName((String)row.get("username"));
        	  user.setUserPassword((String)row.get("userpassword"));
        	  user.setUserActive((String)row.get("active"));
        	  listUsers.add(user);
           }

         return listUsers;
     }
     */
}