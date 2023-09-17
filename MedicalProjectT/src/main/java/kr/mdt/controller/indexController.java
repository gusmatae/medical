package kr.mdt.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.mdt.service.CompanyMemberService;

@Controller
public class indexController {
	@Autowired
	CompanyMemberService companymemberservice;
	
	@RequestMapping("/")
	public String CompanyMemberList(Model model) {

		return "index";
	}	
}