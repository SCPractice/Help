/*EmployeeRegisterController.java
 *实现受雇者的登录功能*/
package cn.edu.zjut.service;
import cn.edu.zjut.dao.IEmployeeDAO;
import cn.edu.zjut.po.Employee;

public class EmployeeLoginController implements IEmployeeLoginController{
	private IEmployeeDAO employeeDAO;
	
	public EmployeeLoginController(){//构造方法
	}
	
	public IEmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(IEmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public boolean login(Employee employee) {//受雇者登录，成功返回true，失败返回false
		System.out.println("execute --login()-- method.");
		if(employeeDAO.login(employee)){//查找数据库是否有该受雇者的信息
			return true;
		}
		else{
			return false;
		}
	}

}
