package com.springbootproject.bbs.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springbootproject.bbs.domain.Board;
import com.springbootproject.bbs.domain.Member;
import com.springbootproject.bbs.domain.Post;
import com.springbootproject.bbs.mapper.BoardMapper;
import com.springbootproject.bbs.mapper.MemberMapper;
import com.springbootproject.bbs.mapper.PostMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
		
	public int login(String memberId, String memberPass) {
		int result = -1;
		Member m = memberMapper.getMember(memberId);
		
		if(m == null) {
			return result;
		}

		if(passwordEncoder.matches(memberPass, m.getMemberPass())) {
			result = 1;
		} else { 
			result = 0;
		}
		
		return result;
		
	}
	
	public Member getMember(String memberId) {
		return memberMapper.getMember(memberId);
	}
	
	public boolean overlapIdCheck(String memberId) {
		Member member = memberMapper.getMember(memberId);
		log.info("overlapIdCheck - member : " + member);
		if(member == null) {
			return false;
		}
		
		return true;
	}
	
	public void addMember(Member member) {
		member.setMemberPass(passwordEncoder.encode(member.getMemberPass()));
		memberMapper.addMember(member);
	}
	
	public boolean memberPassCheck(String memberId, String memberPass) {
		String dbPass = memberMapper.memberPassCheck(memberId);
		boolean result = false;

		if(passwordEncoder.matches(memberPass, dbPass)) {
			result = true;
		}
		return result;
	}
	
	public void updateMember(Member member) {
		member.setMemberPass(passwordEncoder.encode(member.getMemberPass()));
		memberMapper.updateMember(member);
	}
	
	
	
	
}
