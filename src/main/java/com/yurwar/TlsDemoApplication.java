package com.yurwar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@Controller
public class TlsDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(TlsDemoApplication.class, args);
	}


	@GetMapping("/welcome")
	public String getTestPage() {
		return "welcome.html";
	}
}
