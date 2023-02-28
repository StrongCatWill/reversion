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

    public Member getMember(Integer id) {

        return memberMapper.getMember(id);
    }

    /*새 멤버 받는 메소드 부분. getter와 setter가 혼용 사용중이라 수정하고 있음. 리팩터링 하면 integer를 더했음에도 오류가 난다 */
    public Member createMember(Member member) {

//        Member member = new Member();

        //안에 변수 안 넣고 진행하면 따로 오류는 안 나는데 반영이 안 됨.
        member.setId(member.getId());
        member.setName(member.getName());
        member.setAge(member.getAge());
        member.setPhone(member.getPhone());

        return memberMapper.createMember(member);
    }

    /*업데이트 하는 자리 따로 빼야 함.*/
    /*PK 값으로 조회 > id에 해당하는 정보 긁어온 후에 수정 진행(페이지를 따로 빼서?)*/
    public Member updateMember(Integer id, String name, Integer age, Integer phone) {

        Member member = new Member();

        member.setId(id);
        member.setName(name);
        member.setAge(age);
        member.setPhone(phone);

        return memberMapper.updateMember(member);
    }

    public Member CheckMember(Integer id){
        Member member = new Member();


        if(member.equals(id)){
            return memberMapper.getMember(id);
        }else{
            System.out.println("존재하지 않는 ID");
        }

        return memberMapper.getMember(id);

    }

    public int deleteMember(int id) {

        return memberMapper.deleteMember(id);
    }
}