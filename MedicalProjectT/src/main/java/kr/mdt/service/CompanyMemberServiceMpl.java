package kr.mdt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdt.entity.BkMem;
import kr.mdt.entity.CompanyMember;
import kr.mdt.mapper.CompanyMemberMapper;

@Service
public class CompanyMemberServiceMpl implements CompanyMemberService{

	@Autowired
	CompanyMemberMapper companymembermapper;
	
	@Override
	public List<CompanyMember> getList() {
		List<CompanyMember> list = companymembermapper.getList();
		return list;
	}
	
	

}
