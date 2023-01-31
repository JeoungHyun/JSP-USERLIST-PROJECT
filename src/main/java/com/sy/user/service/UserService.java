package com.sy.user.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface UserService {

	List<CommonVO> selectDepartment();
	List<CommonVO> selectJobGrade();
	List<CommonVO> selectJobPosition();
	UserVO userIdChk(String id);
	int userSignUp(UserVO uservo) throws NoSuchAlgorithmException, Exception;
	int userDel(UserVO uservo);
	List<UserVO> userList(SearchVO searchVO) throws Exception;
	UserVO userOneSelect(UserVO uservo);
	int userUpdate(UserVO uservo);
	int userListCount(SearchVO serachVO);
	UserVO userLogin (UserVO uservo) throws NoSuchAlgorithmException;
	String getColor();
	void changeColor(String color);
	
}
