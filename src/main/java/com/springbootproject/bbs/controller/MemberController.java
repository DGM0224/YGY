package com.springbootproject.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbootproject.bbs.domain.Member;
import com.springbootproject.bbs.service.MemberService;

import groovy.util.logging.Slf4j;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@lombok.extern.slf4j.Slf4j
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/login")
	public String login(Model model, @RequestParam("memberId") String memberId, @RequestParam("memberPass") String memberPass,
						HttpSession session, HttpServletResponse response)
						throws ServletException, IOException {
	
		int result = memberService.login(memberId, memberPass);
		if(result == -1) { 
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('존재하지 않는 아이디 입니다.');");
			out.println(" history.back();");
			out.println("</script>");
		
			return null;
		} else if(result == 0) { 
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호가 다릅니다.');");
			out.println(" location.href='loginForm'");
			out.println("</script>");
			return null;
		}
		
		Member member = memberService.getMember(memberId);
		session.setAttribute("isLogin", true);
		
		model.addAttribute("member", member);
		System.out.println("member.name : " + member.getMemberName());
		
		return "redirect:/";
	}
	
	@GetMapping("/memberLogout")
	public String logout(HttpSession session) {
		log.info("MemberController.logout(HttpSession session)");
	
		session.invalidate();
	
		return "redirect:/loginForm";
	}
	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, @RequestParam("memberId") String memberId) {
		boolean overlap = memberService.overlapIdCheck(memberId);	
		model.addAttribute("memberId", memberId);
		model.addAttribute("overlap", overlap);
		return "member/overlapIdCheck.html";
	}
	
	@PostMapping("/joinResult")
	public String joinResult(Model model, Member member, RedirectAttributes reAttrs,
							@RequestParam("pass1") String pass1,
							@RequestParam("emailId") String emailId,
							@RequestParam("emailDomain") String emailDomain,
							@RequestParam("mobile1") String mobile1,
							@RequestParam("mobile2") String mobile2,
							@RequestParam("mobile3") String mobile3,
							@RequestParam("phone1") String phone1,
							@RequestParam("phone2") String phone2,
							@RequestParam("phone3") String phone3,
							@RequestParam(value="emailGet", required=false, defaultValue="false")boolean emailGet) {
	member.setMemberPass(pass1);
	member.setEmail(emailId + "@" + emailDomain);
	member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
	if(phone2.equals("") || phone3.equals("")) {
		member.setPhone("");
	} else {
		member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
	}
	member.setEmailGet(Boolean.valueOf(emailGet));

	memberService.addMember(member);
	
	reAttrs.addFlashAttribute("joinMessage", "회원가입이 완료되었습니당~");

	return "redirect:loginForm";
	}
	
	@GetMapping("/profileUpdateForm")
	public String memberupdateForm(Model model, HttpSession session) {
		return "member/profileUpdate";
	}
	
	@PostMapping("/memberUpdateResult")
	public String memberUpdateInfo(Model model, Member member, RedirectAttributes reAttrs,
									@RequestParam("pass1") String pass1,
									@RequestParam("emailId") String emailId,
									@RequestParam("emailDomain") String emailDomain,
									@RequestParam("mobile1") String mobile1,
									@RequestParam("mobile2") String mobile2,
									@RequestParam("mobile3") String mobile3,
									@RequestParam("phone1") String phone1,
									@RequestParam("phone2") String phone2,
									@RequestParam("phone3") String phone3,
									@RequestParam(value="emailGet", required=false, defaultValue="false")boolean emailGet) {
	member.setMemberPass(pass1);
	member.setEmail(emailId + "@" + emailDomain);
	member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
	if(phone2.equals("") || phone3.equals("")) {
	member.setPhone("");
	} else {
	member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
	}
	member.setEmailGet(Boolean.valueOf(emailGet));
	memberService.updateMember(member);

	model.addAttribute("member", member);
	
	reAttrs.addFlashAttribute("updateProfileMessage", "프로필 수정이 완료되었습니당~");

	return "redirect:/";
	}
	
	
	
	
}
