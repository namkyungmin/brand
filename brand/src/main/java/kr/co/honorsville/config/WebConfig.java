package kr.co.honorsville.config;

/*
 * Login Interceptor
 */

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter{
    
    /*
     * 로그인 인증 Interceptor 설정
     * */
    @Autowired
    CertificationInterceptor certificationInterceptor;
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(certificationInterceptor)
                .addPathPatterns("/smadmin/*")
                .addPathPatterns("/smadmin/*/*")
                .addPathPatterns("/my/*")
                .addPathPatterns("/my/*/*")
                .excludePathPatterns("/smadmin/login")
                .excludePathPatterns("/smadmin/login_proc")
                .excludePathPatterns("/smadmin/signin")
                .excludePathPatterns("/my/faq")
                .excludePathPatterns("/my/myinfo/withdrawal-end")
                ;
        
//        registry.addInterceptor(certificationInterceptor)
//        .addPathPatterns("/smadmin/*")
//        .addPathPatterns("/smadmin/*/*")
//        .excludePathPatterns("/smadmin/login")
//        .excludePathPatterns("/smadmin/login_proc")
//        .excludePathPatterns("/smadmin/signin")
//        ;        
    }
 
}
 
