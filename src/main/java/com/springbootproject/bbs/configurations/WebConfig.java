package com.springbootproject.bbs.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.springbootproject.bbs.interceptor.LoginCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	public void addViewControllers (ViewControllerRegistry registry) {	
		registry.addViewController("/write").setViewName("views/postWrite");
		registry.addViewController("/writePost").setViewName("views/postWrite");
		registry.addViewController("/loginForm").setViewName("member/login");
		registry.addViewController("/joinForm").setViewName("member/join");
		registry.addViewController("/profileUpdateForm").setViewName("member/profileUpdate");
	}
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor())
			.addPathPatterns("/postList", "/postDetail", "/add*", "/write*", "/update*", "/profileUpdate*");
		
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/files/**")
				.addResourceLocations("file:./src/main/resources/static/files/")
				.setCachePeriod(1); 
	}


}
