package com.cdmcs.jw2017.service.jcdm;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by crk0 on 2018-4-2.
 */
@Service
public class JcdmSelectService {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public String queryJcdm(String dmfl, String defaultDM) {
        return queryJcdm(dmfl,defaultDM,null);
    }

    public String queryJcdm(String dmfl, String defaultDM, String ext1) {
        List<Map<String,Object>> list;
        String sql;
        if (!StringUtils.isBlank(ext1)){
            sql = "SELECT t.C_DM as \"id\" ,t.C_MC as \"text\" , DECODE(t.C_DM,?,'1','0')AS \"selected\" FROM t_code_jcdm t WHERE t.C_LBDM = ? AND t.C_KZSX_1=?  AND t.C_YXBZ = '1' ORDER BY t.N_SORT ";
            list = jdbcTemplate.queryForList(sql,defaultDM,dmfl,ext1);
        }else{
            sql = "SELECT t.C_DM as \"id\" ,t.C_MC as \"text\" , DECODE(t.C_DM,?,'1','0')AS \"selected\" FROM t_code_jcdm t WHERE t.C_LBDM = ? AND t.C_YXBZ = '1' ORDER BY t.N_SORT ";
            list = jdbcTemplate.queryForList(sql,defaultDM,dmfl);
        }
        JSONObject retJSON = new JSONObject();
        retJSON.put("results",list);
        return retJSON.toJSONString();

    }
}
