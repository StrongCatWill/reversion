package com.example.reversion.model;
//이미 test DB에 들어있는 걸 따로 선언하면 겹치지 않나? 맵핑 받아올 정보를 여기서 선언하는 건가?

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    private int id;

    private String name;

    private int age;

    private int pNum;
}
