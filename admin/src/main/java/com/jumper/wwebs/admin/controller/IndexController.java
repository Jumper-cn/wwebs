package com.jumper.wwebs.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class IndexController extends AbstractAdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(value = "/index.jumper")
	public ModelAndView index(HttpServletRequest request,RedirectAttributes attr) {
		logger.info("IndexController->index");
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("index",model);
	}
}
