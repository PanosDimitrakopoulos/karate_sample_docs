package features.Authentication.test.java.com.authTs;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;


@KarateOptions(features = {
        "classpath:authTs/tests/LoginAuth.feature",
})

@RunWith(Karate.class)
public class Authorization_Runner {

}
