package com.firstadvancejavaproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstadvancejavaproject.model.DepartmentModel;

public class DepartmentDAO {

	public List<DepartmentModel> getDeptInfo() {

		List<DepartmentModel> li = new ArrayList<>();
		DepartmentModel dm = new DepartmentModel();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from department");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int a = rs.getInt(1);
				String s1 = rs.getString(2);
				String s2 = rs.getString(3);

				li.add(new DepartmentModel(a, s1, s2));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(li);
		return li;

	}

	public String insertDept(DepartmentModel dm) {

		String status = "failure";

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("insert into department values (?,?,?)");
			ps.setInt(1, dm.getDeptNo());
			ps.setString(2, dm.getDeptName());
			ps.setString(3, dm.getLocation());

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

	public boolean deleteDept(DepartmentModel dm) {

		boolean status = false;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("JDBC:mysql://localhost:3306/office", "root", "root");

			PreparedStatement ps = con.prepareStatement("delete from department where DeptNo = ?");
			ps.setInt(1, dm.getDeptNo());

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

	public static DepartmentModel getDeptById(int deptId) {
		DepartmentModel department = null;
		String url = "jdbc:mysql://localhost:3306/office";
		String username = "root";
		String password = "root";

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			String query = "SELECT * FROM department WHERE DeptNo = ?";
			try (PreparedStatement ps = connection.prepareStatement(query)) {
				ps.setInt(1, deptId);

				try (ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						int id = rs.getInt("deptNo");
						String name = rs.getString("deptName");
						String loc = rs.getString("location");
						department = new DepartmentModel(id, name, loc);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return department;
	}

	public static boolean updateDepartmentDetails(int departmentId, String name, String location) {
		String url = "jdbc:mysql://localhost:3306/office";
		String username = "root";
		String password = "root";
		boolean isUpdated = false;

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			String query = "UPDATE department SET DeptName = ?, Location = ? WHERE DeptNo = ?";
			try (PreparedStatement ps = connection.prepareStatement(query)) {
				ps.setString(1, name);
				ps.setString(2, location);
				ps.setInt(3, departmentId);

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

}
