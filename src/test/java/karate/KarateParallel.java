package karate;

import com.daasworld.hellokarate.HelloKarateApplication;
import com.intuit.karate.junit5.Karate;

import org.junit.jupiter.api.Tag;
import org.springframework.boot.test.context.SpringBootTest;


public class KarateParallel {

    @Karate.Test
    @Tag("parallel")
    @Tag("core")
    Karate maniTest() {
        return Karate.run("classpath:karate/hello/helloworld.feature");
    }
    
}