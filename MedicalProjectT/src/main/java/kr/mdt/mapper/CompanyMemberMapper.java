package kr.mdt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.mdt.entity.BkMem;
import kr.mdt.entity.CompanyMember;

@Mapper
public interface CompanyMemberMapper {

	public List<CompanyMember> getList();
}
