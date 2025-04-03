package com.springbootproject.bbs.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springbootproject.bbs.service.MemberService;

@RestController
public class AjaxProcessController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/passCheck.ajax")
	public Map<String, Boolean> memberPassCheck(@RequestParam("memberId") String memberId, @RequestParam("memberPass") String memberPass) {
	
	boolean result = memberService.memberPassCheck(memberId, memberPass);
	Map<String, Boolean> map = new HashMap<String, Boolean>();
	map.put("result", result);
	
	return map;
	}
}