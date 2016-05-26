//受雇者注册接口类
package cn.edu.zjut.service;

import cn.edu.zjut.po.Employee;

public interface IEmployeeRegisterController {
	public boolean register(Employee employee);//注册
	public boolean registerUpdate(Employee employee);//信息更新
	public boolean update(Employee employee);
/*	public boolean uploadidface(Employee employee);
	public boolean uploadidback(Employee employee);*/
	public boolean check(String employeeID);
}
