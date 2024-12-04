package com.firstadvancejavaproject.model;

public class EmployeeModel {

	private int empId;
	private String empName;
	private String empGender;
	private String empJob;
	private String empStatus;
	private int deptNo;
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String password;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpJob() {
		return empJob;
	}

	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public EmployeeModel() {

	}

	public EmployeeModel(int empId, String empName, String empGender, String empJob, String empStatus, int deptNo) {

		this.empId = empId;
		this.empName = empName;
		this.empGender = empGender;
		this.empJob = empJob;
		this.empStatus = empStatus;
		this.deptNo = deptNo;
	}
	
	

	public EmployeeModel(int empId, String empName, String empGender, String empJob, String empStatus, int deptNo,
			String email, String password) {
	
		this.empId = empId;
		this.empName = empName;
		this.empGender = empGender;
		this.empJob = empJob;
		this.empStatus = empStatus;
		this.deptNo = deptNo;
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "EmployeeModel [empId=" + empId + ", empName=" + empName + ", empGender=" + empGender + ", empJob="
				+ empJob + ", empStatus=" + empStatus + ", deptNo=" + deptNo + "]";
	}

}
