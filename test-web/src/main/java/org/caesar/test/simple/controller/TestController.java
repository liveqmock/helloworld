package org.caesar.test.simple.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ssfTest")
public class TestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(TestController.class);
    

    @RequestMapping("/show")
    public String show() {
    	LOGGER.debug("hello.");
        return "screen/input";
    }

}
