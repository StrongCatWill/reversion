package com.example.reversion.service;

import com.example.reversion.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface  MemberMapper {

     Member getMember();
     List<Member> getMemberList();
     int createMember(Member member);
     int updateMember(Member member);
     int deleteMember(int id);
}
