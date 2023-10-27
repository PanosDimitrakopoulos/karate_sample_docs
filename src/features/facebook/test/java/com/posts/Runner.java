package features.facebook.test.java.com.posts

/posts;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@KarateOptions(features = { "classpath:facebook/posts/posts.feature" })
@RunWith(Karate.class)
public class Runner {

}