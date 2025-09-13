function fn() {
  var config = {
    baseUrl: 'https://serverest.dev',
    ssl: true
  };

  karate.configure('ssl', config.ssl);
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}
