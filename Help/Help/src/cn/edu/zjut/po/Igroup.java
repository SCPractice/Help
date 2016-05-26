package cn.edu.zjut.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Igroup {

	private String groupID;//组号
	private String groupName;//组名
	private String groupDescribe;//小组描述
	private Date createTime;//小组创建时间
	
	//以下是各属性的get和set方法
	public String getGroupID() {
		return groupID;
	}
	public void setGroupID(String groupID) {
		this.groupID = groupID;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupDescribe() {
		return groupDescribe;
	}
	public void setGroupDescribe(String groupDescribe) {
		this.groupDescribe = groupDescribe;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
