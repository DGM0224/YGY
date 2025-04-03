package com.springbootproject.bbs.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootproject.bbs.domain.Board;
import com.springbootproject.bbs.domain.Post;
import com.springbootproject.bbs.mapper.BoardMapper;
import com.springbootproject.bbs.mapper.PostMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	
		
	public Board getBoard(int boardNo) {
		log.info("BoardService: getBoard(boardNo)");
		return boardMapper.getBoard(boardNo);
	}
	
	
}
