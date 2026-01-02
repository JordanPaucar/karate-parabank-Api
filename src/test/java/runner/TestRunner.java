package runner;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:bdd") // tu feature
                .tags("@listaCuentas")
                .outputCucumberJson(true); // genera reporte JSON y salida en consola
    }
}