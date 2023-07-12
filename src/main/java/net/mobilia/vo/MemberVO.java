package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_post;
	private String m_roadAddr;
	private String m_jibunAddr;
	private String m_detailAddr;
	private String m_phone01;
	private String m_phone02;
	private String m_phone03;
	private String mail_id;
	private String mail_domain;
	private String m_birth01;
	private String m_birth02;
	private String m_birth03;
	private String m_date;
	private int m_state;
	private String m_delcont;
	private String m_deldate;
	private String find_field; //검색필드
	private String find_name; //검색어
	private int startrow;
	private int endrow;
	public String getEmail() {
		return null;
	}
	
	
}
