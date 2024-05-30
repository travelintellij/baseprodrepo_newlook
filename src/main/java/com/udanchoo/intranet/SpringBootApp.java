package com.udanchoo.intranet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.udanchoo.intranet.repository.UserRepository;
import com.udanchoo.intranet.util.FileStorageProperties;

@EnableJpaAuditing
@SpringBootApplication
@EnableJpaRepositories(basePackageClasses=UserRepository.class)
@EnableConfigurationProperties({
    FileStorageProperties.class
})
@ComponentScan
//@PropertySource(value = { "classpath:services-discovery-prod.properties" })
@PropertySource(value = { "classpath:services-discovery.properties" })
public class SpringBootApp extends WebMvcAutoConfiguration  
{
      /*
	@Autowired
	EmailServiceImpl emailService;
	*/
	
	public static void main(String[] args) 
     {
         SpringApplication.run(SpringBootApp.class, args);
     } 

	
	/*
     @Override
     public void run(ApplicationArguments applicationArguments) throws Exception {
    	 System.out.println("Sending Email with Freemarker HTML Template Example");

         Mail mail = new Mail();
         mail.setFrom("no-reply@nexstepstudio.com");
         mail.setTo("ritik.makker@gmail.com");
         mail.setSubject("Freemarker Embedded Image Test");

         Map model = new HashMap();
         model.put("clientName", "Ritik");
         model.put("Services", "<li>Flight<li>Hotel<li>Visa<li>SightSeeings");
         model.put("serviceAdvisor", "Manisha Bhomia");
         model.put("contactNumber", "99 99 44 6267");
         
         
         model.put("signature", "founder, UdanChoo.com | travelGovernor.com");
         mail.setModel(model);

         emailService.sendEmailMessageUsingTemplate(mail,"Deal-Confirmation.ftl");
     }
     */
}
