package vn.nhtw420.pcshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    @Bean
    public ViewResolver viewResolver() {
        final InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/view/");
        bean.setSuffix(".jsp");
        return bean;
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.viewResolver(viewResolver());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Admin resources
        registry.addResourceHandler("/resources/admin/**")
                .addResourceLocations("/resources/admin/");

        // Client resources
        registry.addResourceHandler("/resources/client/**")
                .addResourceLocations("/resources/client/");

        // Images (for homepage and all pages)
        registry.addResourceHandler("/resources/images/**")
                .addResourceLocations("/resources/images/");

        // General resources fallback
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");

        // Webjars
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }
}