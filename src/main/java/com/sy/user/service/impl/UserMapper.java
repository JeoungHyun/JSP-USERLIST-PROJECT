package com.sy.user.service.impl;

import java.util.List;

import com.sy.user.service.CommonVO;
import com.sy.user.service.SearchVO;
import com.sy.user.service.UserVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {

	List<CommonVO> selectDepartment();

	List<CommonVO> selectJobGrade();

	List<CommonVO> selectJobPosition();

	UserVO userIdChk(String id);

	int userSignUp(UserVO uservo);

	List<UserVO> userList(SearchVO searchvo);

	int userListCount(SearchVO searchvo);

	int userDel(UserVO uservo);

	UserVO userOneSelect(UserVO uservo);

	int userUpdate(UserVO uservo);
	
	UserVO userLogin(UserVO uservo);
	
	String getColor();
	
	void changeColor(String color);

}
