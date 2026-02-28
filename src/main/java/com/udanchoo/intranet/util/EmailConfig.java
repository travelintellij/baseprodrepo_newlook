package com.udanchoo.intranet.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
 
@Configuration
public class EmailConfig 
{
 
	
	@Value("${spring.b2b.mail.username}")
	private String b2BEmailUsername;
	
	
	@Value("${spring.b2b.mail.password}")
	private String b2bEmailPassword;
	
	@Value("${notification1.mail.username}")
	private String notification1EmailUsername;
	
	
	@Value("${notification1.mail.password}")
	private String notification1EmailPassword;
	
	
	@Value("${b2b.email.from}")
	private String b2BEmailFrom;
	
	@Value("${spring.mail.host}")
	private String emailHost;

    @Value("${spring.b2b.mail.port}")
	private int emailPort;

    @Value("${spring.b2b.mail.properties.mail.transport.protocol}")
    private String emailProtocol;
	
	@Value("${spring.mail.properties.mail.smtp.auth}")
	private String smtpAuth;
	
	@Value("${spring.mail.properties.mail.debug}")
	private String mailDebug;



	
	
	@Bean
    public SimpleMailMessage emailTemplate()
    {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("sushil@udanchoo.com");
        message.setFrom("sales@udanchoo.com");
        message.setSubject("First Testing Governor email, Congratulations !!");
        message.setText("If you can see this email then you are luck and you have configured your service correctly.");
        return message;
    }
    
    
	@Bean
    public JavaMailSender getB2bJavaMailSender() 
    {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(emailHost);
        mailSender.setPort(emailPort);
          
        mailSender.setUsername(b2BEmailUsername);
        mailSender.setPassword(b2bEmailPassword);
        
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", emailProtocol);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", mailDebug);

         
        
        mailSender.setJavaMailProperties(props);
          
        return mailSender;
    }


	@Override
	public String toString() {
		return "EmailConfig [b2BEmailUsername=" + b2BEmailUsername + ", b2bEmailPassword=" + b2bEmailPassword
				+ ", b2BEmailFrom=" + b2BEmailFrom + ", emailHost=" + emailHost + ", emailPort=" + emailPort
				+ ", emailProtocol=" + emailProtocol + ", smtpAuth=" + smtpAuth + ", mailDebug=" + mailDebug + "]";
	}




    @Bean
    public Session getNotification1EmailSessionSender() {

        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", emailHost);
        props.put("mail.smtp.port", emailPort);
        props.put("mail.debug", "true"); // enable temporarily

        return Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(notification1EmailUsername, notification1EmailPassword);
            }
        });
    }


}
