package com.example.reversion.service;

import com.example.reversion.controller.DemoController;
import com.example.reversion.mapper.MemberMapper;
import com.example.reversion.model.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

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

    public Member createMember(Integer id, String name, Integer age, Integer phone) {

        Member member = new Member();

        member.setId(id);
        member.setName(name);
        member.setAge(age);
        member.setPhone(phone);

        return memberMapper.createMember(member);
    }

/*    업데이트 하는 자리*/
    public Member updateMember(Integer id, String name, Integer age, Integer phone) {

        Member member = new Member();

        member.setId(id);
        member.setName(name);
        member.setAge(age);
        member.setPhone(phone);

        return memberMapper.updateMember(member);
    }

    public int deleteMember(int id) {

        return memberMapper.deleteMember(id);
    }
}