package com.example.reversion.mapper;

import com.example.reversion.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface  MemberMapper {

     Member getMember(Integer id);
     List<Member> getMemberList();
     Member createMember(Member member);
     Member updateMember(Member member);
     int deleteMember(int id);

     /*Member CheckMember(int id);*/
}
