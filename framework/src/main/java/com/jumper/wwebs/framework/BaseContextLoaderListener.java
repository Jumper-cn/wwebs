package com.jumper.wwebs.framework;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

public class BaseContextLoaderListener extends ContextLoaderListener {
	/**
	 * Initialize the root web application context.
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
	}

	/**
	 * Close the root web application context.
	 */
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		super.contextDestroyed(event);
	}
}
