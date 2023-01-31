package com.sy.user.service;

import java.util.Arrays;
import java.util.Date;

public class UserVO {

	private String userId;
	private String[] userIdList;
	private String userPassword;
	private String userFirstName;
	private String userLastName;
	private String userFullName;
	private String userPhoneNumber;
	private String userHomeNumber;
	private String userEmail;
	private String userZipCode;
	private String userRoadName;
	private String userDetailAdress;
	private String userAdress;
	private int userDepartment;
	private String userDepartmentName;
	private int userRank;
	private String userRankName;
	private int userPosition;
	private String userPositionName;
	private Date userRegDt;
	private Date userModDt;
	private String createrId;
	
	public String getCreaterId() {
		return createrId;
	}
	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String[] getUserIdList() {
		return userIdList;
	}
	public void setUserIdList(String[] userIdList) {
		this.userIdList = userIdList;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public String getUserLastName() {
		return userLastName;
	}
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserHomeNumber() {
		return userHomeNumber;
	}
	public void setUserHomeNumber(String userHomeNumber) {
		this.userHomeNumber = userHomeNumber;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAdress() {
		return userAdress;
	}
	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}
	public int getUserDepartment() {
		return userDepartment;
	}
	public void setUserDepartment(int userDepartment) {
		this.userDepartment = userDepartment;
	}
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public int getUserPosition() {
		return userPosition;
	}
	public void setUserPosition(int userPosition) {
		this.userPosition = userPosition;
	}
	public Date getUserRegDt() {
		return userRegDt;
	}
	public void setUserRegDt(Date userRegDt) {
		this.userRegDt = userRegDt;
	}
	public Date getUserModDt() {
		return userModDt;
	}
	public void setUserModDt(Date userModDt) {
		this.userModDt = userModDt;
	}
	
	public String getUserDepartmentName() {
		return userDepartmentName;
	}
	public void setUserDepartmentName(String userDepartmentName) {
		this.userDepartmentName = userDepartmentName;
	}
	public String getUserRankName() {
		return userRankName;
	}
	public void setUserRankName(String userRankName) {
		this.userRankName = userRankName;
	}
	public String getUserPositionName() {
		return userPositionName;
	}
	public void setUserPositionName(String userPositionName) {
		this.userPositionName = userPositionName;
	}
	public String getUserFullName() {
		return userFullName;
	}
	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}
	public String getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
	}
	public String getUserRoadName() {
		return userRoadName;
	}
	public void setUserRoadName(String userRoadName) {
		this.userRoadName = userRoadName;
	}
	public String getUserDetailAdress() {
		return userDetailAdress;
	}
	public void setUserDetailAdress(String userDetailAdress) {
		this.userDetailAdress = userDetailAdress;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userIdList=" + Arrays.toString(userIdList) + ", userPassword="
				+ userPassword + ", userFirstName=" + userFirstName + ", userLastName=" + userLastName
				+ ", userFullName=" + userFullName + ", userPhoneNumber=" + userPhoneNumber + ", userHomeNumber="
				+ userHomeNumber + ", userEmail=" + userEmail + ", userZipCode=" + userZipCode + ", userRoadName="
				+ userRoadName + ", userDetailAdress=" + userDetailAdress + ", userAdress=" + userAdress
				+ ", userDepartment=" + userDepartment + ", userDepartmentName=" + userDepartmentName + ", userRank="
				+ userRank + ", userRankName=" + userRankName + ", userPosition=" + userPosition + ", userPositionName="
				+ userPositionName + ", userRegDt=" + userRegDt + ", userModDt=" + userModDt + "]";
	}
	

	
	
	
}
	
	