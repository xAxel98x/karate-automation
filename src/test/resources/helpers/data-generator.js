function fn() {
  function randomInt(max) {
    return Math.floor(Math.random() * max);
  }

  function randomEmail() {
    return 'user' + Date.now() + randomInt(999) + '@gmail.com';
  }

  function randomName() {
    return 'TestUser' + (Date.now() % 10000) + randomInt(999);
  }

  function usuarioRandom() {
    return {
      nome: randomName(),
      email: randomEmail(),
      password: '1234',
      administrador: 'true'
    };
  }
 function usuarioDatosInvalido() {
    return {
      nome: '132',
      email: '123',
      password: '&%$',
      administrador: '&%$'
    };
  }
  function usuarioDatosVacios() {
    return {
      nome: '',
      email: '',
      password: '',
      administrador: ''
    };
  }

  return {
    usuarioRandom: usuarioRandom,
    usuarioDatosInvalido: usuarioDatosInvalido,
    usuarioDatosVacios: usuarioDatosVacios
  };
}

