package com.springbootproject.bbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.springbootproject.bbs.domain.Board;


@Mapper
public interface BoardMapper {
			
	public Board getBoard(int postNo);
	
}
