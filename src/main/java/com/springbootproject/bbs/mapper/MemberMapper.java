package com.springbootproject.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springbootproject.bbs.domain.Board;
import com.springbootproject.bbs.domain.Member;
import com.springbootproject.bbs.domain.Post;

@Mapper
public interface MemberMapper {
			
	public Member getMember(String memberId);
	
	public void addMember(Member member);
	
	public String memberPassCheck(String memberId);
	
	public void updateMember(Member member);
	
}
