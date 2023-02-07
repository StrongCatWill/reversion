package com.example.reversion.controller;

import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class DemoController {

    private final MemberService memberService;

    @GetMapping("/list")
    public ModelAndView test(HttpServletRequest httpServletRequest, Model model){


        //---------------DB에 있는 값 뿌려주는 부분---------------------

        ModelAndView mav = new ModelAndView("list");

        extracted(mav);


        return mav;
    }

    private void extracted(ModelAndView mav) {
        List<Member> memberList = memberService.getMemberList();
        mav.addObject("members", memberList);
    }


    /*항상 먼저 GetMapping이 들어가야 함.*/
    @GetMapping("/form")
    public ModelAndView formpage(Model model){
        ModelAndView mav = new ModelAndView("form");
        return mav;
    }
    @PostMapping("form")

    /*포스트로 받는 곳은 항상 GetMapping 후에 들어와야 한다. 웹페이지는 페이지가 로딩 된 이후에 로직이 돌아간다.*/
    public ModelAndView testInsert(HttpServletRequest httpServletRequest,
                                   @RequestParam Integer id,
                                   @RequestParam String name,
                                   @RequestParam Integer age,
                                   @RequestParam Integer phone,
                                   Model model){

        ModelAndView mav = new ModelAndView("list");

        try{
            Member member = memberService.createMember(id, name, age, phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("ID:" + id +"name: "+name + "age: "+age + "phone: "+phone);
        }

        extracted(mav);
        //이 위의 try-catch문은 update에 관한 것이므로 전체 controller가 반환하는 값은 저 블록 밖에 위치해야 함.
        return mav;
    }

    @GetMapping("/modify")
    public ModelAndView modify(Model model){
        ModelAndView mav = new ModelAndView("modify");
        return mav;
    }

    @PostMapping("modify")
    public ModelAndView modifier(HttpServletRequest httpServletRequest,
                                 @RequestParam Integer id,
                                 @RequestParam String name,
                                 @RequestParam Integer age,
                                 @RequestParam Integer phone, Model model){

        ModelAndView mav = new ModelAndView("modify");

        try{
            Member member = memberService.updateMember(id, name, age, phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("수정된 ID:" + id +"수정된 name: "+name + "수정된 age: "+age + "수정된 phone: "+phone);
        }
        return mav;
    }
}