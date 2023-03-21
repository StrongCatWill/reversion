package com.example.reversion.controller;


import com.example.reversion.model.MemberModel;
import com.example.reversion.service.MemberModelService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final MemberModelService memberModelService;

    @GetMapping("/main")
    public ModelAndView mainpage(){
        System.out.println("멤버 서비스 창 연결 성공");
        ModelAndView mav = new ModelAndView("main/mainpage");
        return mav;
    }

    @GetMapping("/main/list")
    public ResponseEntity<List<MemberModel>> mainList(@RequestParam("limit") Integer limit, @RequestParam("offset") Integer offset){

        System.out.println("main (pagination) List 연결 성공");

        List<MemberModel> memberList = memberModelService.getMemberModelList(limit, offset);

        return new ResponseEntity<>(memberList, HttpStatus.OK);
    }




    @GetMapping("/main/add")
    public ModelAndView addMember(){
        ModelAndView modelAndView = new ModelAndView("/main/add");
        return modelAndView;
    }


    @ResponseBody
//    @RequestMapping(value = "/main/add", method = RequestMethod.POST)
    @PostMapping("/main/add")
    public ResponseEntity<MemberModel> addForm(@RequestBody MemberModel memberModel){

        try{
            memberModelService.createMemberModel(memberModel);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseEntity.ok(memberModel);
    }


//    디테일 보여주는 페이지 컨트롤러, 이건 넘어오는 다른 페이지의 데이터가 없는 대신, hover된 데이터를 보여주는 것임.
    @RequestMapping("/main/detail")
    public String modify(Model model, @RequestParam(name = "memberID", required = true) String memberID){

    MemberModel memberModel = memberModelService.getMemberModel(memberID);

    //맴버에 id, name, age, phone 다 들어 있으므로 따로 정의할 필요 없음.
    model.addAttribute("memberModel", memberModel);
    System.out.println("list 페이지에서 선택한 아이디 호출 \n memberID : "+memberID);

    return "/main/detail";
    }

    @PostMapping("/main/detail")
    public ModelAndView modifier(@RequestParam String memberID,
                                 Model model){

        ModelAndView mav = new ModelAndView("/main/detail");

        try{
            MemberModel memberModel = memberModelService.CheckMemberModel(memberID);

            if (memberModelService.CheckMemberModel(memberID).equals(memberID)){
                model.addAttribute("memberModel", memberModelService.CheckMemberModel(memberID));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("확인된 ID:" + memberID);
            System.out.println(model);

        }
        return mav;
    }

    //update 기능 구현
    @GetMapping("/main/update")
    public ModelAndView update(){
        ModelAndView modelAndView = new ModelAndView("/main/update");
        return modelAndView;
    }

    @PostMapping("/main/update")
    public ResponseEntity<MemberModel> updateController(@RequestBody MemberModel memberModel){

        ModelAndView mav = new ModelAndView("/main/update");

        try{
            System.out.print("변경되는 memberModel 값 확인 ----------------------> "+memberModel.getMemberCodeNum()+" ," +memberModel.getMemberID()+ " , "+memberModel.getMemberName()+ " , "+memberModel.getMemberPhone());
            memberModelService.updateMemberModel(memberModel);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseEntity.ok(memberModel);
    }


    //delete 기능 구현
    @GetMapping("/main/delete")
    public ModelAndView delete(){
        ModelAndView modelAndView = new ModelAndView("/main/delete");
        return modelAndView;
    }

    @PostMapping("/main/delete")
    public ResponseEntity<MemberModel> deleteController(@RequestBody MemberModel memberModel){
        ModelAndView mav = new ModelAndView("/main/delete");

        try{
            System.out.println("삭제되는 memberCodeNum ---------> "+memberModel.getMemberCodeNum());
            memberModelService.deleteMemberModel(memberModel.getMemberCodeNum());
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseEntity.ok(memberModel);
    }


}
