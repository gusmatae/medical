package kr.mdt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.mdt.entity.BkMem;
import kr.mdt.entity.CompanyMember;
import kr.mdt.service.CompanyMemberService;

@Controller
public class CompanyMemberController {
	@Autowired
	CompanyMemberService companymemberservice;
	
	@RequestMapping("/CompanyMemberList.do")
	public @ResponseBody List<CompanyMember> AjaxCompanyMemberList() {
		List<CompanyMember> list = companymemberservice.getList();
		return list;
	}	
	
	@RequestMapping("/CompanyMemberList")
	public String CompanyMemberList() {
		return "company/CompanyMemberList";
	}	
	
	/*
	@RequestMapping("/CompanyMemberList.do")
	public String CompanyMemberList(Model model) {
		List<CompanyMember> list = companymemberservice.getList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "company/CompanyMemberListTest";
	}	
	*/
}