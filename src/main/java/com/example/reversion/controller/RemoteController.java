package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class RemoteController {

    private final MemberService memberService;

    /*testMain 접속하면 뜨는 창*/
    @GetMapping("/testMain")
    public String testMain(){
        System.out.println("ajax 띄울 페이지에 연결 성공");
        return "Main";
    }

    /*멤버 리스트 띄우는 기능*/
    @GetMapping("/test2/list")
    public ResponseEntity<List<Member>> test2List(){
        System.out.println("test2/list 연결 성공");

        List<Member> memberList = memberService.getMemberList();

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }


    @RequestMapping("/test2/test2Detail")
    public ResponseEntity<Member> test2Detail
            (@RequestParam(name = "id", required = true) Integer id, Model model){

        System.out.println("test2/test2Detail 연결 성공");

        Member member = memberService.getMember(id);
        model.addAttribute("member", member);

        return new ResponseEntity<>(member, HttpStatus.OK);
    }

    @PostMapping("/test2/form")
    public ResponseEntity<Member> test2Form(HttpServletRequest httpServletRequest,
                                            @RequestParam(name = "id") Integer id,
                                            @RequestParam(name = "name") String name,
                                            @RequestParam(name = "age") Integer age,
                                            @RequestParam(name = "phone") Integer phone){

        System.out.println("test2/form 로딩 성공");
        Member member = memberService.createMember(id, name, age, phone);

        return new ResponseEntity<>(member, HttpStatus.OK);
        
    }
}
