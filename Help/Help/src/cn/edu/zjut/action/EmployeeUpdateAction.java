/*受雇者个人信息更新Action*/
package cn.edu.zjut.action;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.zjut.po.Employee;
import cn.edu.zjut.service.IEmployeeRegisterController;

public class EmployeeUpdateAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Employee employee;
	private IEmployeeRegisterController employeeRegisterController = null;
	
	public Employee getEmployee() {
		return employee;
	}
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public IEmployeeRegisterController getEmployeeRegisterController() {
		return employeeRegisterController;
	}

	public void setEmployeeRegisterController(IEmployeeRegisterController employeeRegisterController) {
		this.employeeRegisterController = employeeRegisterController;
	}
	
	public String registerUpdate() {
		if(employeeRegisterController.registerUpdate(employee))
			return "updatesuccess";
		else return "updatefailed";
	}
	
	public String update() {
		if(employeeRegisterController.update(employee))
			return "updatesuccess";
		else return "updatefailed";
	}
	
	public String uploadheader() {
		if(employeeRegisterController.register(employee))
			return "uploadsuccess";
		else return "uploadfailed";
	}
	public String check() {
		if(employeeRegisterController.check(employee.getEmployeeID()))
			return "success";
		else
			return "failed";
		
	}
}