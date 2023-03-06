package com.example.reversion.model;
import lombok.Data;

import java.util.Date;

@Data
public class MemberModel {
    private Integer memberCodeNum;

    private String memberID;

    private String memberName;

    private String memberPhone;

    private Character memberGender;

    private Date memberBirth;
}
