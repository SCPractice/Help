package cn.edu.zjut.service;

import cn.edu.zjut.po.Employee;
import cn.edu.zjut.po.Order;

public interface IOrderUpdateController {
	boolean accept(Order order, Employee employee);
	boolean submit(Order order);
}
