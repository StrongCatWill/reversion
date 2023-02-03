package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
public class DemoController {

    private final MemberService memberService;

    @GetMapping("/test")
    public String test(){

        Member member = memberService.getMember();

        System.out.println(member.toString());



        return "test";
    }
}
