package com.udanchoo.intranet.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.model.Tag;

@Controller
public class MainController {

	List<Tag> data = new ArrayList<Tag>();

	MainController() {
		// init data for testing
		data.add(new Tag(1L, "ruby"));
		data.add(new Tag(2L, "rails"));
		data.add(new Tag(3L, "c / c++"));
		data.add(new Tag(4L, ".net"));
		data.add(new Tag(5L, "python"));
		data.add(new Tag(6L, "java"));
		data.add(new Tag(7L, "javascript"));
		data.add(new Tag(8L, "jscript"));

	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getPages() {

		ModelAndView model = new ModelAndView("example");
		Tag tag = new Tag();
		model.addObject("tag", tag);
		return model;

	}

	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getTags(@RequestParam String tagName) {

		return simulateSearchResult(tagName);

	}

	private List<Tag> simulateSearchResult(String tagName) {

		List<Tag> result = new ArrayList<Tag>();

		// iterate a list and filter by tagName
		for (Tag tag : data) {
			if (tag.getTagName().contains(tagName)) {
				result.add(tag);
			}
		}

		return result;
	}

	 @PostMapping("/adminCreateCustomer2")
	  	public ModelAndView adminCreateCustomer(HttpServletRequest request,@ModelAttribute("tag") Tag tag, BindingResult result, ModelMap model) {
		
		 Enumeration enumeration = request.getParameterNames();
	        Map modelMap = new HashMap();
	        while(enumeration.hasMoreElements()){
	            String parameterName = (String) enumeration.nextElement();
	            String parameterValue = request.getParameter(parameterName);
	            System.out.println(parameterName + " --- " + parameterValue);
	            modelMap.put(parameterName, parameterValue);
	            
	            
	        }
		 ModelAndView mapview = new ModelAndView("example");
		
		 System.out.println(tag);
		 System.out.println("Sushil Admin Create Customer is invoked !! ");
		 return mapview;
	 }
}
