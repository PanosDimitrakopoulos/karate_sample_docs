function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    loginUrl: "https://staging.api.facebook.com/v1/passwordauthenticationrequest",
    baseUrl : "https://staging.api.facebook.com",
    authenticationFeature: "../Authentication.feature"

  };
  var result = karate.callSingle('classpath:facebook/authentication/Auth.feature',{'username' : 'facebook.user'});
  config.token = result.jws;


  return config;
}