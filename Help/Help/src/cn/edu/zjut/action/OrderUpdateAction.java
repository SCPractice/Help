/*受雇者注册辅助Action*/
package cn.edu.zjut.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.po.*;
import cn.edu.zjut.service.IOrderUpdateController;

public class OrderUpdateAction {
	private IOrderUpdateController orderUpdateController;
	private Employee employee;
	private Order order;

	public IOrderUpdateController getOrderUpdateController() {
		return orderUpdateController;
	}

	public void setOrderUpdateController(IOrderUpdateController orderUpdateController) {
		this.orderUpdateController = orderUpdateController;
	}

	@SuppressWarnings("rawtypes")
	public String accept(){//接受招募
		Map session=ActionContext.getContext().getSession();
		employee=(Employee)session.get("employee");
		if(employee!=null && employee.isEmployeeState()){  //检查权限
			if(orderUpdateController.accept(order,employee)){
				System.out.println(order.getStartTime());
				return "success";
			}
			return "failed";
		}
		else return "noright";  //没有权限
	}
	
	@SuppressWarnings({ "rawtypes" })
	public String submit(){//完成任务
		Map session=ActionContext.getContext().getSession();
		order=(Order) session.get("order");
		System.out.println(order.getOrderID());
		if(orderUpdateController.submit(order)){
			return "success";
		}
		else return "failed";
	}
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
