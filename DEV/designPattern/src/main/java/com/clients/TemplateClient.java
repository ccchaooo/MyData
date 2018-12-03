package com.clients;

import com.dps.template.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:31
 * 模板方法模式客户端代码
 */
@Service
public class TemplateClient implements Client{

    @Autowired
    @Qualifier(value = "moneyMarketAccount")
    Account moneyMarketAccount;

    @Autowired
    @Qualifier(value = "cDAccount")
    Account cDAccount;

    public String clientInterface() {
    return "货币市场账号的利息数额为：" + moneyMarketAccount.calculateInterest()
            + " ---- "
            + "定期账号的利息数额为：" + cDAccount.calculateInterest();
    }
}
