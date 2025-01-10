package io.github.angelogalvao.example.cq;

import org.apache.camel.builder.RouteBuilder;

public class ExampleRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {
        
        from("timer:producer?period={{timer.period}}")
            .routeId("readingDataFromDatabaseRoute")
            .log("Executing a SQL on datbase")
            .to("sql:select * from example_table?outputType=StreamList")
            .to("log:stream")
            .split(body()).streaming()
                .to("log:row")
                .to("mock:result")
            .end();
    }

    
}
