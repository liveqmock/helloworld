package org.caesar.test.simple.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suning.ssf.endpoint.service.GenericService;

@Controller
@RequestMapping("/ssfTest")
public class TestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(TestController.class);
    
    @Autowired(required=false)
    @Qualifier("rcsServer")
    private GenericService service;

    @RequestMapping("/show")
    public String show() {
    	System.out.println("hello");
        return "screen/input";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("/result")
    public String result(ModelMap modelMap) {
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> payTypeMap = service.synCall("queryPayTypeInfo", map);
        LOGGER.debug("查询入款渠道，返回：responseCode：" + payTypeMap.get("responseCode"));
        return "screen/result";
    }
}
