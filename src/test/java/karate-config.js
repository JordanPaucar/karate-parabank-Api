function fn() {

  var env = karate.env || 'dev';

  var config = {
    baseUrl: 'https://parabank.parasoft.com/parabank/services/bank',

    credentials: {
      username: 'eeeee',
      password: 'eeeee',
      usernamewrong: 'hola123',
      passwordwrong: 'testwrong'
    }
  };
  karate.configure('headers', {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    });
  karate.configure('cookies', { read: true });


  return config;
}
