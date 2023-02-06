package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequiredArgsConstructor
public class DemoController {

    private final MemberService memberService;

    @GetMapping("/test")
    public ModelAndView test(){

        Member member = memberService.getMember();
        ModelAndView mav = new ModelAndView("test");
        mav.addObject("member", member);
        System.out.println(member.toString());

        return mav;
    }
}