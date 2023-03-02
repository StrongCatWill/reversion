package com.example.reversion.controller;


import com.example.reversion.model.Member;
import com.example.reversion.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return mav;
    }

    @GetMapping("/main/list")
    public ResponseEntity<List<Member>> mainList(){

        System.out.println("main page List 연결 성공");

        List<Member> memberList = memberService.getMemberList();

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }


    @GetMapping("/main/add")
    public ModelAndView addMember(){
        ModelAndView modelAndView = new ModelAndView("/main/add");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/main/add", method = RequestMethod.POST)
    /*등록 페이지에서 입력을 받아내는 testInsert 메소드. */
    /*포스트로 받는 곳은 항상 GetMapping 후에 들어와야 한다. 웹페이지는 페이지가 로딩 된 이후에 로직이 돌아간다.*/
    public ResponseEntity<Member> addForm(@ModelAttribute Member member){

        try{
            memberService.createMember(member);
            return ResponseEntity.ok(member);
        }catch (Exception e){
            e.printStackTrace();
        }


        return new ResponseEntity(null, HttpStatus.BAD_REQUEST);
    }


//    디테일 보여주는 페이지 컨트롤러, 이건 넘어오는 다른 페이지의 데이터가 없는 대신, hover된 데이터를 보여주는 것임.
@RequestMapping("/main/detail")
public String modify(Model model, @RequestParam(name = "id", required = true) Integer id){

    Member member = memberService.getMember(id);

    //맴버에 id, name, age, phone 다 들어 있으므로 따로 정의할 필요 없음.
    model.addAttribute("member", member);
    System.out.println("list 페이지에서 선택한 아이디 호출 \n ID : "+id);

    return "/main/detail";
    }

    @PostMapping("/main/detail")
    public ModelAndView modifier(@RequestParam Integer id,
                                 Model model){

        ModelAndView mav = new ModelAndView("/main/detail");

        try{
            Member member = memberService.CheckMember(id);

            if (memberService.CheckMember(id).equals(id)){
                model.addAttribute("member", memberService.CheckMember(id));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("확인된 ID:" + id);
            System.out.println(model);
        }
        return mav;
    }
}
