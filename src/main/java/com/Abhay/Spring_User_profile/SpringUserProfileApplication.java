package com.Abhay.Spring_User_profile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class SpringUserProfileApplication {

	public static void main(String[] args) {

		ApplicationContext context=SpringApplication.run(SpringUserProfileApplication.class, args);
	}

}
