package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class DemoController {

    private final MemberService memberService;

    @GetMapping("/test")
    public ModelAndView test(){

        Member member = memberService.getMember();
        ModelAndView mav = new ModelAndView("test");

        /*List<Member>memberList = memberService.getMemberList();
        for(int i=1; i<memberList.size();i++){
            mav.addObject("member", memberList);
        }*/

        List<Member> memberList1 = memberService.getMemberList();
        mav.addObject("members", memberList1);

        /* 40라인과 같은 것.
        for( int i = 0 ; i < memberList1.size(); i++){
           Member item = memberList1.get(i);
           System.out.print(item.getName());
        }
        */
        for(Member item : memberList1){
            System.out.print(item.getName());
        }


        return mav;
    }


    

}