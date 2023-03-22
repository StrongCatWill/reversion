package com.example.reversion.mapper;

import com.example.reversion.model.MemberModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper_2 {

    MemberModel getMemberModel(String memberID);

    List<MemberModel> getMemberModelList(Integer limit, Integer offset);

    List<MemberModel> getMemberModeWholelList();

    void createMemberModel(MemberModel member);

    void updateMemberModel(MemberModel memberModel);

    Integer deleteMemberModel(Integer memberCodeNum);

//    MemberModel CheckMemberModel(String memberID);

    ;
}
