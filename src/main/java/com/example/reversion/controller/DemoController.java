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


        //---------------메인 루트가 되는 부분---------------------

        ModelAndView mav = new ModelAndView("list");

        extracted(mav);
        return mav;
    }


    //멤버 리스트 따로 처리하는 추출 메소드.
    private void extracted(ModelAndView mav) {
        List<Member> memberList = memberService.getMemberList();
        mav.addObject("members", memberList);
    }


    /*항상 먼저 GetMapping이 들어가야 함.*/
    /*등록 페이지인 from.jsp 페이지 */
    @GetMapping("/form")
    public ModelAndView formpage(Model model){
        ModelAndView mav = new ModelAndView("form");
        return mav;
    }

    @PostMapping("form")
    /*등록 페이지에서 입력을 받아내는 testInsert 메소드. */
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


    /*수정 페이지인 modify로 이동하는 매핑.*/
    @RequestMapping("/detail")
    public String modify(Model model, @RequestParam(name = "id", required = true) Integer id){

        Member member = memberService.getMember(id);

        model.addAttribute("member", member);
        /*model.addAttribute(name);
        model.addAttribute(age);
        model.addAttribute(phone);
*/
        System.out.println("list 페이지에서 선택한 아이디 호출 \n ID : "+id);
     /*   System.out.println("list 페이지에서 선택한 이름 호출 \n ID : "+name);
        System.out.println("list 페이지에서 선택한 나이 호출 \n ID : "+age);
        System.out.println("list 페이지에서 선택한 전화번호 호출 \n ID : "+phone);*/

        return "/detail";
    }


    @PostMapping("/detail")
    public ModelAndView modifier(HttpServletRequest httpServletRequest,
                                 @RequestParam Integer id,
                                 Model model){

        ModelAndView mav = new ModelAndView("/detail");

        try{
            Member member = memberService.CheckMember(id);

            if (memberService.CheckMember(id).equals(id)){


          /*    model.addAttribute("id",memberService.CheckMember(id));*/
                model.addAttribute("member", memberService.CheckMember(id));

                /*model.addAttribute(age);
                model.addAttribute(name);*/

                /*@Mapping("/modify")
                        public ModelAndView moveToModify(Model model){

                        ModelAndView mav = new ModelAndView("modify");
                        return mav;
                }*/
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("확인된 ID:" + id);
            extracted(mav);
            System.out.println(model);
        }
        return mav;
    }

    @GetMapping("/modify")
    public ModelAndView detail(Model model){
        ModelAndView mav = new ModelAndView("modify");
        return mav;
    }






}