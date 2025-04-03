package com.springbootproject.bbs.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Post {
	
	private int boardNo;
	private int postNo;
	private String postTitle;
	private String writer;
	private String postContent;
	private Timestamp postDate;
	private int viewCount;
	private String file1;
	private int good;
	private int bad;

}
