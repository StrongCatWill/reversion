package com.example.reversion;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class ReversionApplication {

	public static void main(String[] args) {

		SpringApplication.run(ReversionApplication.class, args);

	}
	/*@Bean
	public InternalResourceViewResolver setupViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();

		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}*/

}
