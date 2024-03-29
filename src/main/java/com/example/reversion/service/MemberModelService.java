package com.example.reversion.service;

import com.example.reversion.mapper.MemberMapper_2;
import com.example.reversion.model.MemberModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberModelService {

    private final MemberMapper_2 memberMapper2;

    //페이징 처리를 위한 것. 컨트롤러에서 이걸 그대로 전송해주어야 한다.
    private Integer limit;
    private Integer offset;

    public List<MemberModel> getMemberModelList(Integer limit, Integer offset){

        return memberMapper2.getMemberModelList(limit, offset);
    }

    public List<MemberModel> getMemberModeWholelList(){

        return memberMapper2.getMemberModeWholelList();
    }


    public MemberModel getMemberModel(String memberID){
        return memberMapper2.getMemberModel(memberID);
    }

    //자, memberCodeNum은 따로 입력을 받지 않아도 생성되는 auto incrememtn인데 memberModel에는 memberCodeNum이 모두 포함되어 있다. 따로 세팅을 해줘야 할 것 같다.
    public void createMemberModel(MemberModel memberModel){

        MemberModel member = new MemberModel();
        member.setMemberID(memberModel.getMemberID());
        member.setMemberName(memberModel.getMemberName());
        member.setMemberPhone(memberModel.getMemberPhone());
        member.setMemberGender(memberModel.getMemberGender());
        member.setMemberBirth(memberModel.getMemberBirth());

        memberMapper2.createMemberModel(member); //return type == void 경우
//        return memberMapper2.createMemberModel(member);
    }

    public void updateMemberModel(MemberModel memberModel){

        MemberModel member = new MemberModel();

        member.setMemberCodeNum(memberModel.getMemberCodeNum());
        member.setMemberID(memberModel.getMemberID());
        member.setMemberName(memberModel.getMemberName());
        member.setMemberPhone(memberModel.getMemberPhone());

        memberMapper2.updateMemberModel(member);
    }

    public MemberModel CheckMemberModel(String memberID){
        MemberModel memberModel = new MemberModel();

        if(memberModel.equals("memberID")){
            return memberMapper2.getMemberModel(memberID);
        }else{
            System.out.println("존재하지 않는 멤버입니다.");
        }
        return memberMapper2.getMemberModel(memberID);
    }

    public void deleteMemberModel(Integer memberCodeNum){

        memberMapper2.deleteMemberModel(memberCodeNum);
    }
}
