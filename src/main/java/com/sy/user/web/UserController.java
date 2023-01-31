package com.sy.user.web;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sy.user.service.CommonVO;
import com.sy.user.service.SearchVO;
import com.sy.user.service.UserService;
import com.sy.user.service.UserVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/idCheckPopup.do")
	public String idCheckPopup(HttpServletRequest request ){
		
		return "idCheckPopup";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request ){
		
		return "login";
	}
	
	@ResponseBody
	@RequestMapping("userLogin.ajax")
	public String userLogin(HttpServletRequest request ,@RequestParam Map<String,Object> param) throws NoSuchAlgorithmException{
		String msg = "";
		
		UserVO uservo = new UserVO();
		uservo.setUserId(param.get("userId").toString());
		uservo.setUserPassword(param.get("userPassword").toString());
		
		uservo = userService.userLogin(uservo);
		
		if(null == uservo){
			 msg = "no";
		}else{
			 msg = "ok";
			HttpSession session = request.getSession();
			session.setAttribute("userId", uservo.getUserId());
			String ip = request.getHeader("WL-Proxy-Client-IP");
			ip = request.getRemoteAddr();
			String browser = request.getHeader("User-Agent");
			 
			System.out.println("ip = " + ip );
			System.out.println("browser = " + browser);
		}
		return msg;
	}
	

	@RequestMapping("/main.do")
	public String mainDo(HttpServletRequest request, SearchVO searchVO, Model model) throws Exception {

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		if (searchVO.getFirstIndex() != 0) {
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex() + 1);
		}
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage() + paginationInfo.getFirstRecordIndex());

		String color = userService.getColor();
		List<UserVO> userList = userService.userList(searchVO);

		int totCnt = userService.userListCount(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("paginationInfo", paginationInfo);
/*		for(int i = 0 ; i < userList.size() ; i++){
			
			String number = "";
			number = userList.get(i).getUserPhoneNumber().substring(0,3);
			number += "-";
			number += userList.get(i).getUserPhoneNumber().substring(3,7);
			number += "-";
			number += userList.get(i).getUserPhoneNumber().substring(7,userList.get(i).getUserPhoneNumber().length());
			userList.get(i).setUserPhoneNumber(number);
		}*/
		model.addAttribute("color", color);
		model.addAttribute("userList", userList);
		return "main";
	}

	@RequestMapping("/registerUser.do")
	public String register(HttpServletRequest request, SearchVO searchVO, Model model) throws Exception {

		String color = userService.getColor();
		List<UserVO> userList = userService.userList(searchVO);
		
		List<CommonVO> department = userService.selectDepartment();
		List<CommonVO> jopGrade = userService.selectJobGrade();
		List<CommonVO> jobPosition = userService.selectJobPosition();

		model.addAttribute("department", department);
		model.addAttribute("jopGrade", jopGrade);
		model.addAttribute("jobPosition", jobPosition);
		model.addAttribute("color", color);
		return "registerUser";
	}
	
	@RequestMapping("/modifyUser.do")
	public String modifyUser(@RequestParam("userId") String userId ,Model model) throws Exception {
		
		UserVO uservo = new UserVO();
		uservo.setUserId(userId);
		String color = userService.getColor();
		uservo = userService.userOneSelect(uservo);
		
		List<CommonVO> department = userService.selectDepartment();
		List<CommonVO> jopGrade = userService.selectJobGrade();
		List<CommonVO> jobPosition = userService.selectJobPosition();
		
		model.addAttribute("uservo", uservo);
		model.addAttribute("department", department);
		model.addAttribute("jopGrade", jopGrade);
		model.addAttribute("jobPosition", jobPosition);
		model.addAttribute("color", color);
		return "modifyUser";
	}

	@ResponseBody
	@RequestMapping(value = "/userIdChk.ajax" ,method = { RequestMethod.POST })
	public String userIdChk(  @RequestParam Map<String,Object> param ,Model model) throws Exception {
		String msgCode = "ok";
		UserVO uservo = new UserVO();
		uservo.setUserId(param.get("userId").toString());
		UserVO result = userService.userIdChk(uservo.getUserId());
		if(null == result){
			msgCode ="no";
		}
		return msgCode;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/userReg.ajax" ,method = { RequestMethod.POST })
	public String userReg( HttpServletRequest request, @RequestParam Map<String,Object> param ,Model model) throws Exception {
		HttpSession session = request.getSession();
		String msg = "no";
		
		UserVO uservo = new UserVO();
		uservo.setUserId(param.get("userId").toString());
		uservo.setUserPassword(param.get("userPassword").toString());
		uservo.setUserFirstName(param.get("userFirstName").toString());
		uservo.setUserLastName(param.get("userLastName").toString());
		uservo.setUserFullName(param.get("userFullName").toString());
		uservo.setUserPhoneNumber(param.get("userPhoneNumber").toString());
		uservo.setUserHomeNumber(param.get("userHomeNumber").toString());
		uservo.setUserEmail(param.get("userEmail").toString());
		uservo.setUserZipCode(param.get("userZipCode").toString());
		uservo.setUserRoadName(param.get("userRoadName").toString());
		uservo.setUserDetailAdress(param.get("userDetailAdress").toString());
		uservo.setUserAdress(param.get("userAdress").toString());
		uservo.setUserDepartment(Integer.parseInt(param.get("userDepartment").toString()));
		uservo.setUserRank(Integer.parseInt(param.get("userRank").toString()));
		uservo.setUserPosition(Integer.parseInt(param.get("userPosition").toString()));
		uservo.setCreaterId("");
		if(null != session.getAttribute("userId")){
		uservo.setCreaterId(session.getAttribute("userId").toString());  
		}
		int resultCode = userService.userSignUp(uservo);
		  if(resultCode==1){
			  msg = "ok";
		  }
		return msg;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/userMod.ajax" ,method = { RequestMethod.POST })
	public String userMod(  @RequestParam Map<String,Object> param ,Model model) throws Exception {
		
		String msg = "no";
		
		UserVO uservo = new UserVO();
		uservo.setUserId(param.get("userId").toString());
		uservo.setUserPassword(param.get("userPassword").toString());
		uservo.setUserFirstName(param.get("userFirstName").toString());
		uservo.setUserLastName(param.get("userLastName").toString());
		uservo.setUserFullName(param.get("userFullName").toString());
		uservo.setUserPhoneNumber(param.get("userPhoneNumber").toString());
		uservo.setUserHomeNumber(param.get("userHomeNumber").toString());
		uservo.setUserEmail(param.get("userEmail").toString());
		uservo.setUserZipCode(param.get("userZipCode").toString());
		uservo.setUserRoadName(param.get("userRoadName").toString());
		uservo.setUserDetailAdress(param.get("userDetailAdress").toString());
		uservo.setUserAdress(param.get("userAdress").toString());
		uservo.setUserDepartment(Integer.parseInt(param.get("userDepartment").toString()));
		uservo.setUserRank(Integer.parseInt(param.get("userRank").toString()));
		uservo.setUserPosition(Integer.parseInt(param.get("userPosition").toString()));
		  
		  int resultCode = userService.userUpdate(uservo);
		  if(resultCode==1){
			  msg = "ok";
		  }
		return msg;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/userDel.ajax" ,method = { RequestMethod.POST })
	public String userDel(  HttpServletRequest request) throws Exception {
		String msgCode = "no";
		String[] ajaxMsg = request.getParameterValues("userList");
		UserVO uservo = new UserVO();
		int result = 0;
		uservo.setUserIdList(ajaxMsg);
	    result =userService.userDel(uservo);
		
	    if(result >= 1){
	    	msgCode = "ok";
	    }
		
		return msgCode;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeColor.ajax" ,method = { RequestMethod.POST })
	public void changeColor(  HttpServletRequest request) throws Exception {
		String color = request.getParameter("color");
		userService.changeColor(color);
		
		
	}
	
	
	

}
