package com.clients;

import com.dps.builder.Builder;
import com.dps.builder.ConcreteBuilder;
import com.dps.builder.Director;
import com.dps.builder.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 15:39
 */
@Service
public class BuilderClient implements Client {

    /**
     * 某个具体的建造者builder
     */
    private Builder builder = new ConcreteBuilder();

    /**
     * 导演者Director持有建造者builder,并指导builder进行建造
     */
    private Director director = new Director(builder);


    public String clientInterface() {
        //导演者指挥建造者进行生产
        director.construct();
        //从builder处获取product
        Product product = builder.retrieveResult();

        return product.getPart1() + "  " + product.getPart2();
    }
}
