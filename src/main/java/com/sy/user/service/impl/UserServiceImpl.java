package com.sy.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import java.security.*;

import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import com.sy.common.AES256;
import com.sy.common.SHA256;
import com.sy.user.service.CommonVO;
import com.sy.user.service.SearchVO;
import com.sy.user.service.UserService;
import com.sy.user.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userMapper")
	private UserMapper userMapper;

	@Override
	public List<CommonVO> selectDepartment() {
		return userMapper.selectDepartment();
	}

	@Override
	public List<CommonVO> selectJobGrade() {
		return userMapper.selectJobGrade();
	}

	@Override
	public List<CommonVO> selectJobPosition() {
		return userMapper.selectJobPosition();
	}

	@Override
	public UserVO userIdChk(String id) {
		return userMapper.userIdChk(id);
	}

	@Override
	public int userSignUp(UserVO uservo) throws Exception {
		SHA256 sha256 = new SHA256();
		AES256 aes256 = new AES256();
		uservo.setUserPassword(sha256.encrypt(uservo.getUserPassword()));
		uservo.setUserEmail(aes256.encrypt(uservo.getUserEmail()));
		return userMapper.userSignUp(uservo);
	}

	@Override
	public List<UserVO> userList(SearchVO searchvo) throws Exception {
		AES256 aes256 = new AES256();
		List<UserVO> uservo =  userMapper.userList(searchvo);
		for(int i = 0 ; i<uservo.size() ; i++){
			uservo.get(i).setUserEmail(aes256.decrypt(uservo.get(i).getUserEmail()));
		}
		
		return uservo;
	}

	@Override
	public int userDel(UserVO uservo) {
		return userMapper.userDel(uservo);
	}

	@Override
	public UserVO userOneSelect(UserVO uservo) {
		return userMapper.userOneSelect(uservo);
	}

	@Override
	public int userUpdate(UserVO uservo) {
		return userMapper.userUpdate(uservo);	
	}

	@Override
	public int userListCount(SearchVO serachVO) {
		return userMapper.userListCount(serachVO);
	}
	@Override
	public UserVO userLogin(UserVO uservo) throws NoSuchAlgorithmException {
		SHA256 sha256 = new SHA256();
		uservo.setUserPassword(sha256.encrypt(uservo.getUserPassword()));
		return userMapper.userLogin(uservo);
	}

	@Override
	public String getColor() {
		return userMapper.getColor();
	}

	@Override
	public void changeColor(String color) {
		userMapper.changeColor(color);
		
	}

}
