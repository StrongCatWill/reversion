package com.example.reversion.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class remoteController {

    @GetMapping("/testMain")
    public String testMain(){
        System.out.print("ajax 띄울 페이지에 연결 성공");
        return "testMain";
    }

    @PostMapping("request_ajax")
    public String request_ajax(@RequestParam(name = "text") String text){
        System.out.println(text);

        return "request_ajax";
    }
}
