package com.jumper.wwebs.framework;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/zoneol_framework_context.xml" })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestFrameorkUtils {

	//@Autowired
	//private OffstoreService offstoreService;

	@Test
	public void testA() {
		System.out.println("TestFrameorkUtils->testA");
	}

	@Test
	public void testZ() {
		System.out.println("TestFrameorkUtils->testZ");
		
	}
}
