package cn.edu.zjut.po;

import java.util.Date;

public class TeamMessage {
	private int teamMessageID;
	private String messageSender;
	private String messageContent;
	private Date messageTime;
	private String chatTeamID;
	
	public TeamMessage(){}

	public int getTeamMessageID() {
		return teamMessageID;
	}

	public void setTeamMessageID(int teamMessageID) {
		this.teamMessageID = teamMessageID;
	}

	public String getMessageSender() {
		return messageSender;
	}

	public void setMessageSender(String messageSender) {
		this.messageSender = messageSender;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}

	public String getChatTeamID() {
		return chatTeamID;
	}

	public void setChatTeamID(String chatTeamID) {
		this.chatTeamID = chatTeamID;
	}
}
