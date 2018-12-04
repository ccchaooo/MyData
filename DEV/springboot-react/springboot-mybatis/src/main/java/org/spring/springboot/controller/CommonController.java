package org.spring.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 *
 * @author dengchao
 * @date 22/11/2018
 */
@Controller
@RequestMapping("com")
public class CommonController {


    @RequestMapping("/test")
    public String first(){
        return "template";
    }


    /**
     * @date 22/11/2018
     * @return optrow.jsp 操作行记录
     */
    @RequestMapping("/optrow")
    public String optrow(){
        return "optrow";
    }
}
