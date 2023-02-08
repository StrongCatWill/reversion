package com.example.reversion.model;
//이미 test DB에 들어있는 걸 따로 선언하면 겹치지 않나? 맵핑 받아올 정보를 여기서 선언하는 건가?

import lombok.Data;

@Data
public class Member {

    private Integer id;

    private String name;

    private Integer age;

    private Integer phone;
}
