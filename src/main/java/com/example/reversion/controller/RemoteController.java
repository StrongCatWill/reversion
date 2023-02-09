package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;


import java.util.List;

@Controller
@RequiredArgsConstructor
public class RemoteController {

    private final MemberService memberService;

    @GetMapping("/testMain")
    public String testMain(){
        System.out.println("ajax 띄울 페이지에 연결 성공");
        return "test2/testMain";
    }

    /*멤버 리스트 띄우는 기능*/
    @GetMapping("/test2/list")
    public ResponseEntity<List<Member>> test2List(){
        System.out.println("test2/list 연결 성공");

        List<Member> memberList = memberService.getMemberList();

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }


    @RequestMapping("/test2/detail")
    public ResponseEntity<Member> detail
            (@RequestParam(name = "id", required = true) Integer id, Model model){

        System.out.println("test2/detail 연결 성공");

        Member member = memberService.getMember(id);
        model.addAttribute("member", member);

        return new ResponseEntity<>(member, HttpStatus.OK);
    }


}
