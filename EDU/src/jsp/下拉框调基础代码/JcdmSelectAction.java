package com.cdmcs.jw2017.actions.jcdm;

import com.cdmcs.jw2017.service.jcdm.JcdmSelectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 基础代码select控制器
 * Created by crk0 on 2018-4-2.
 */
@Controller
@RequestMapping("/code")
public class JcdmSelectAction {
    @Autowired
    JcdmSelectService jcdmSelectService;

    @RequestMapping(value = "/jcdm",produces="application/json;charset=UTF-8")
    @ResponseBody
    public String queryJcdm(@RequestParam(value = "dmfl") String dmfl, @RequestParam(value = "defaultDM",required = false) String defaultDM, @RequestParam(value = "ext1",required = false) String ext1){
        return jcdmSelectService.queryJcdm(dmfl,defaultDM,ext1);
    }
}
