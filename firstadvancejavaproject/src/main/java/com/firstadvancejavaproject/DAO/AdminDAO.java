package com.firstadvancejavaproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.firstadvancejavaproject.model.AdminLoginModel;
import com.firstadvancejavaproject.model.EmployeeModel;

public class AdminDAO {

	public boolean getAdminInfo(AdminLoginModel alm) {

		boolean status = false;
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from AdminInfo where email = ? and password = ?");
			ps.setString(1, alm.getEmail());
			ps.setString(2, alm.getPassword());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = true;

			} else {
				status = false;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
