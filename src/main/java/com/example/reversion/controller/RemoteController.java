package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class RemoteController {

    private final MemberService memberService;

    @GetMapping("/testMain")
    public String testMain(){
        System.out.print("ajax 띄울 페이지에 연결 성공");
        return "test2/testMain";
    }

    @GetMapping("/test2/list")
    public ResponseEntity<List<Member>> test2List(){

        List<Member> memberList = memberService.getMemberList();

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }




}
