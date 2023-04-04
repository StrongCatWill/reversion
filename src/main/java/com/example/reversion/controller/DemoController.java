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
    public ModelAndView test(){


        //---------------메인 루트가 되는 부분---------------------

        ModelAndView mav = new ModelAndView("test1/list");

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
    public ModelAndView formpage(){
        ModelAndView mav = new ModelAndView("test1/form");
        return mav;
    }

    @PostMapping("form")
    /*등록 페이지에서 입력을 받아내는 testInsert 메소드. */
    /*포스트로 받는 곳은 항상 GetMapping 후에 들어와야 한다. 웹페이지는 페이지가 로딩 된 이후에 로직이 돌아간다.*/
    public ModelAndView testInsert(HttpServletRequest httpServletRequest,
                                   @RequestParam Integer id,
                                   @RequestParam String name,
                                   @RequestParam Integer age,
                                   @RequestParam Integer phone){

        ModelAndView mav = new ModelAndView("test1/list");

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


    /*list 페이지에서 id를 클릭했을 때 넘어오는 detail 페이지. .*/
    @RequestMapping("/detail")
    public String modify(Model model, @RequestParam(name = "id", required = true) Integer id){

        //member를 새로 정의할 필요가 있음. member는 위에서 여러 번 정의했으므로 어느 메서드를 쓰는지 정확하게 재정의하기.
        Member member = memberService.getMember(id);

        //맴버에 id, name, age, phone 다 들어 있으므로 따로 정의할 필요 없음.
        model.addAttribute("member", member);

        /*model.addAttribute(name);
        model.addAttribute(age);
        model.addAttribute(phone);
*/
        System.out.println("list 페이지에서 선택한 아이디 호출 \n ID : "+id);

        return "test1/detail";
    }


    @PostMapping("/detail")
    public ModelAndView modifier(@RequestParam Integer id,
                                 Model model){

        ModelAndView mav = new ModelAndView("test1/detail");

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



/*    회원 정보 수정창 modify 페이지*/
    @GetMapping("/modify")
    public String  goModify(Model model, @RequestParam(name = "id", required = true) Integer id){
        Member member = memberService.getMember(id);

        //맴버에 id, name, age, phone 다 들어 있으므로 따로 정의할 필요 없음.
        model.addAttribute("member", member);
        return "test1/modify";
    }

    @PostMapping("/modify2")
    public ModelAndView modify(Model model,
                         @ModelAttribute(name = "id") Integer id,
                         @ModelAttribute(name = "nm") String name,
                         @ModelAttribute(name = "age") Integer age,
                         @ModelAttribute(name = "phone") Integer phone){

        ModelAndView mav = new ModelAndView("test1/list");

        try{
            System.out.print("기존 ID:" + id +"기존 name: "+name + "기존 age: "+age + "기존 phone: "+phone+"\n");
            Member member = memberService.updateMember(id, name, age, phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.print("수정된 name: "+name + "수정된 age: "+age + "수정된 phone: "+phone);
            extracted(mav);
        }
        return mav;
    }
}