package com.example.reversion.service;

import com.example.reversion.mapper.MemberMapper_2;
import com.example.reversion.model.MemberModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberModelService {

    private final MemberMapper_2 memberMapper2;

    public List<MemberModel> getMemberModelList(){

        return memberMapper2.getMemberModelList();
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



        memberMapper2.createMemberModel(member);

    }

    public MemberModel updateMemberModel(String memberID,
                                         String memberName, String memberPhone,
                                         Character memberGender, Date memberBirth){

        MemberModel memberModel = new MemberModel();

        memberModel.setMemberID(memberID);
        memberModel.setMemberName(memberName);
        memberModel.setMemberPhone(memberPhone);
        memberModel.setMemberGender(memberGender);
        memberModel.setMemberBirth(memberBirth);

        return memberMapper2.updateMemberModel(memberModel);
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

    public int deleteMemberModel(String memberID){
        return memberMapper2.deleteMemberModel(memberID);
    }
}
