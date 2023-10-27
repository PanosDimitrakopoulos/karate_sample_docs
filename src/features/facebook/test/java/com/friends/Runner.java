package features.facebook.test.java.com.friends

/friends;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@KarateOptions(features = { "classpath:facebook/friends/friends.feature" })
@RunWith(Karate.class)
public class Runner {

}