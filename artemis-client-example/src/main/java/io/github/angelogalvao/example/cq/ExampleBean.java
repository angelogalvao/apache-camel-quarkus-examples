package io.github.angelogalvao.example.cq;

import org.eclipse.microprofile.config.inject.ConfigProperty;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;

@Named("myBean")
@ApplicationScoped
public class ExampleBean {
    
    @ConfigProperty(name = "greeting")
    private String say;

    public String saySomething() {
        return say;
    }
}
