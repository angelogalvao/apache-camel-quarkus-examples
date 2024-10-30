package io.github.angelogalvao.example.cq;

import org.apache.camel.builder.RouteBuilder;

public class ExampleRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {
        
        from("timer:producer?period={{timer.period}}")
            .routeId("sendMessageToArtemis")
            .transform().method("myBean", "saySomething")
            .to("jms:queue:{{test.queue}}");

        from("jms:queue:{{test.queue}}")
            .routeId("consumeMessageFromArtemis")
            .log("${body}");
    }
    

}
