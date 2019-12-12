package org.ecommerce.login;

import java.sql.*;

import org.ecommerce.util.BaseDato;

public class UserDAO {	
	
	public User checkLogin(String username, String password) throws SQLException,
    ClassNotFoundException {
		
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;		
		ResultSet rs1 = null;
		String sql = "";
		
		conexion1 = basedato.getConnection();
		sql = "SELECT * FROM users WHERE username = ? and password = ?";
		PreparedStatement statement = conexion1.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        rs1 = statement.executeQuery();
        
        User user = null;
        
        if (rs1.next()) {
            user = new User();
            user.setUsername(rs1.getString("username"));
            user.setUser_type(rs1.getInt("user_type"));
            user.setId(rs1.getInt("id"));
        }
 
        conexion1.close();
		
		return user;
		
	}
	

}
