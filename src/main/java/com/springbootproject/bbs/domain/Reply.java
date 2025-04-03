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
	public class Reply {
	private int replyNo;
	private int postNo;
	private String replyContent;
	private String replyWriter;
	private Timestamp replyDate;
}
