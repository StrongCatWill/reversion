package com.example.reversion.controller;


import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final MemberService memberService;

    @GetMapping("/main")
    public ModelAndView mainpage(){
        System.out.println("멤버 서비스 창 연결 성공");
        ModelAndView mav = new ModelAndView("main/mainpage");

        extracted(mav);
        return mav;
    }

    @GetMapping("/main/list")
    public ResponseEntity<List<Member>> mainList(){

        System.out.println("main page List 연결 성공");

        List<Member> memberList = memberService.getMemberList();

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }

    private void extracted(ModelAndView mav) {
        List<Member> memberList = memberService.getMemberList();
        mav.addObject("members", memberList);
    }

    @GetMapping("/main/add")
    public ModelAndView addMember(){
        ModelAndView modelAndView = new ModelAndView("/main/add");
        return modelAndView;
    }

    @PostMapping("/main/add")
    /*등록 페이지에서 입력을 받아내는 testInsert 메소드. */
    /*포스트로 받는 곳은 항상 GetMapping 후에 들어와야 한다. 웹페이지는 페이지가 로딩 된 이후에 로직이 돌아간다.*/
    public ModelAndView addForm(HttpServletRequest httpServletRequest,
                                   @RequestParam Integer id,
                                   @RequestParam String name,
                                   @RequestParam Integer age,
                                   @RequestParam Integer phone){

        ModelAndView mav = new ModelAndView("/main/add");

        try{
            Member member = memberService.createMember(id, name, age, phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("ID:" + id +"name: "+name + "age: "+age + "phone: "+phone);
        }

        //이 위의 try-catch문은 update에 관한 것이므로 전체 controller가 반환하는 값은 저 블록 밖에 위치해야 함.
        return (mav);
    }
}
