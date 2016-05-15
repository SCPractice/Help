package cn.edu.zjut.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import cn.edu.zjut.po.Employee;
import cn.edu.zjut.service.EmployeeTeamController;

public class EmployeeTeamAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Employee employee;
	private EmployeeTeamController employeeTeamsController;
	private List teamMemberList;
	private Map<String,Object> session;
	public String findTeam(){
		teamMemberList=employeeTeamsController.findTeam();
		ActionContext ctx= ActionContext.getContext();
		session=(Map) ctx.getSession();
		session.put("teamMemberList", teamMemberList);
		
		return "success";
	}
	
	public String employeeExitTeam(){
		if(employeeTeamsController.exitTeam())
			return "success";
		return "failed";
	}
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	public EmployeeTeamController getEmployeeTeamController() {
		return employeeTeamsController;
	}


	public void setEmployeeTeamController(EmployeeTeamController employeeTeamsController) {
		this.employeeTeamsController = employeeTeamsController;
	}


	public List getTeamMemberList() {
		return teamMemberList;
	}


	public void setTeamMemberList(List teamMemberList) {
		this.teamMemberList = teamMemberList;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
}
