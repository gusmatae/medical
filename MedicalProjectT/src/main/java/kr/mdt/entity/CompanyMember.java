package kr.mdt.entity;

import java.util.Date;

import lombok.Data;

@Data
public class CompanyMember {
	int cmIdx;
	String cmName;
	String cmBirth;
	String cmdepartment;
	String cmPosition;
	String cmEmployeeNumber;
	String cmPhonNumber;
	String cmEmail;
	String cmAddress;
	String cmDateJoining;
	int cmWorkHours;
	String cmState;
	String cmProfile;
}
