package runner;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate runAll() {
        // Esto ejecuta TODOS los .feature dentro de src/test/resources/features
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}