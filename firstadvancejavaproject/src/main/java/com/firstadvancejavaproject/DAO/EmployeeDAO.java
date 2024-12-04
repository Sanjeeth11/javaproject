package com.firstadvancejavaproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstadvancejavaproject.model.DepartmentModel;
import com.firstadvancejavaproject.model.EmployeeModel;

public class EmployeeDAO {

	public List<EmployeeModel> getEmpInfo() {

		List<EmployeeModel> li = new ArrayList<>();
		EmployeeModel em = new EmployeeModel();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from employee");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int a = rs.getInt(1);
				String s1 = rs.getString(2);
				String s2 = rs.getString(3);
				String s3 = rs.getString(4);
				String s4 = rs.getString(5);
				int b = rs.getInt(6);

				li.add(new EmployeeModel(a, s1, s2, s3, s4, b));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(li);
		return li;

	}

	public String insertEmp(EmployeeModel em) {

		String status = "failure";

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("insert into employee values (?,?,?,?,?,?)");
			ps.setInt(1, em.getEmpId());
			ps.setString(2, em.getEmpName());
			ps.setString(3, em.getEmpGender());
			ps.setString(4, em.getEmpJob());
			ps.setString(5, em.getEmpStatus());
			ps.setInt(6, em.getDeptNo());

			int n = ps.executeUpdate();

			if (n > 0) {
				System.out.println(n + " row(s) are inserted");
				return status = "true";
			} else {

				System.out.println("not inserted");
				return status = "false";
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;

	}

	public boolean deleteEmp(EmployeeModel em) {

		boolean status = false;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("delete from Employee where EmpNo = ?");
			ps.setInt(1, em.getEmpId());

			int n = ps.executeUpdate();

			if (n > 0) {
				System.out.println(n + " row(s) are deleted");
				return status = true;
			} else {

				System.out.println("not deleted");
				return status = false;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;

	}

	public static EmployeeModel getEmpById(int empId) {
		EmployeeModel employee = null;
		String url = "jdbc:mysql://localhost:3306/office";
		String username = "root";
		String password = "root";

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			String query = "SELECT * FROM Employee WHERE EmpNo = ?";
			try (PreparedStatement ps = connection.prepareStatement(query)) {
				ps.setInt(1, empId);

				try (ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						int id = rs.getInt("EmpNo");
						String ename = rs.getString("EmpName");
						String egender = rs.getString("Gender");
						String ejob = rs.getString("Job");
						String estatus = rs.getString("Empstatus");
						int dNo = rs.getInt("DeptNo");

						employee = new EmployeeModel(id, ename, egender, ejob, estatus, dNo);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employee;
	}

	public static boolean updateEmployeeDetails(int eId, String ename, String egender, String ejob, String estatus,
			int dNo) {
		String url = "jdbc:mysql://localhost:3306/office";
		String username = "root";
		String password = "root";
		boolean isUpdated = false;

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			String query = "UPDATE Employee SET EmpName = ?, Gender = ?, Job = ?, EmpStatus = ?, DeptNo =? WHERE EmpNo = ?";
			try (PreparedStatement ps = connection.prepareStatement(query)) {
				ps.setString(1, ename);
				ps.setString(2, egender);
				ps.setString(3, ejob);
				ps.setString(4, estatus);
				ps.setInt(5, dNo);
				ps.setInt(6, eId);

				int rowsAffected = ps.executeUpdate();
				if (rowsAffected > 0) {
					isUpdated = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	 public EmployeeModel getEmployeeByLogin(String email, String password) {
	        EmployeeModel employee = null;
	        
	    

	        // Database connection details
	        String url = "jdbc:mysql://localhost:3306/office"; // Update with your database details
	        String username = "root"; // Update with your DB username
	        String dbPassword = "root"; // Update with your DB password

	        // SQL query to retrieve employee details based on email and password
	        String query = "SELECT * FROM Employee WHERE Email = ? AND Password = ?";

	        try
	        {
	        
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	Connection connection = DriverManager.getConnection(url, username, dbPassword);
	        
	             PreparedStatement preparedStatement = connection.prepareStatement(query); 

	            preparedStatement.setString(1, email);
	            preparedStatement.setString(2, password);

	            ResultSet resultSet = preparedStatement.executeQuery();

	            // If employee is found, create an Employee object and set its details
	            if (resultSet.next()) {
	                employee = new EmployeeModel(
	                    resultSet.getInt("EmpNo"),
	                    resultSet.getString("EmpName"),
	                    resultSet.getString("Gender"),
	                    resultSet.getString("Job"),
	                    resultSet.getString("EmpStatus"),
	                    resultSet.getInt("DeptNo"),
	                    resultSet.getString("Email"),
	                    resultSet.getString("Password")
	                );
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return employee;
	    }
	

}
