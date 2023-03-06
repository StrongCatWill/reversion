package com.example.reversion.mapper;

import com.example.reversion.model.MemberModel;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MemberMapper_2 {

    MemberModel getMemberModel(String memberID);

    List<MemberModel> getMemberModelList();

    MemberModel createMemberModel(MemberModel memberModel);

    MemberModel updateMemberModel(MemberModel memberModel);

    int deleteMemberModel(String memberID);

    MemberModel CheckMemberModel(String memberID);
}
