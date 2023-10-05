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
	
	@Value("${b2b.mail.port}")
	private int emailPort;
	
	@Value("${b2b.mail.properties.mail.transport.protocol}")
	private String emailProtocol;
	
	@Value("${spring.mail.properties.mail.smtp.auth}")
	private String smtpAuth;
	
	@Value("${spring.mail.properties.mail.debug}")
	private String mailDebug;
	
	@Value("${b2b.mail.properties.mail.smtp.socketFactory.port}")
	private String socketFactoryPort;
	
	@Value("${b2b.mail.properties.mail.smtp.socketFactory.class}")
	private String socketFactoryClass;
	
	
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
        //props.put("mail.smtp.auth", smtpAuth);
        props.put("mail.debug", mailDebug);
        props.put("spring.mail.properties.mail.smtp.socketFactory.port", socketFactoryPort);
        props.put("spring.mail.properties.mail.smtp.socketFactory.class", socketFactoryClass);
         
        
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
		 // SMTP server details
        //String host = "smtp.example.com";
        //int port = 587;
        //String username = "your_username";
        //String password = "your_password";
        // TLS connection properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", emailHost);
        props.put("mail.smtp.port", emailPort);

        // Create session with authentication
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(notification1EmailUsername, notification1EmailPassword);
            }
        });
        return session;
	}
    
    
}
