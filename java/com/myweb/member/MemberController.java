package com.myweb.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	String view;
	
	@GetMapping("join")
	public String join() {
		view = "member/join";
		return view;
	}
	
	@GetMapping("login")
	public String login() {
		view = "member/login";
		return view;
	}
	
	@GetMapping("logout")
	private String logout(HttpSession session) {
		view = "redirect:../";
		session.invalidate();
		return view;
	}
	
	@GetMapping("check")
	private String check() {
		view = "member/pwCheck";
		return view;
	}
	
	@GetMapping("update")
	public String update() {
		view = "member/update";
		return view;
	}
	
	@GetMapping("pwUpdate")
	public String pwUpdate() {
		view = "member/pwUpdate";
		return view;
	}

	@GetMapping("delete")
	public String delete() {
		view = "member/delete";
		return view;
	}
	
	@GetMapping("boardList")
	public String boardList() {
		view = "member/boardList";
		return view;
	}
}
