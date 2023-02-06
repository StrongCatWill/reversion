package com.example.reversion.service;

import com.example.reversion.mapper.MemberMapper;
import com.example.reversion.model.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    public List<Member> getMemberList(){
        return memberMapper.getMemberList();
    }

    public Member getMember() {
        return memberMapper.getMember();
    }

    public int createMember(Member member) {
        return memberMapper.createMember(member);
    }

    public int updateMember(Member member) {
        return memberMapper.updateMember(member);
    }

    public int deleteMember(int id) {
        return memberMapper.deleteMember(id);
    }
}