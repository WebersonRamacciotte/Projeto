#language: pt
Funcionalidade: Login no sistema
  Cenário: Login com sucesso
    Dado que eu acesse a tela de login
    Quando eu efetuo login no sistema
    Então o sistema me redireciona para a página de produtos

  Cenário: Login no sistema com credenciais erradas
    Dado que eu acesse a tela de login
    Quando eu tento efetuar login com credenciais inválidas
    Então o sistema não permite o login
    E o sistema apresenta uma mensagem de erro

  Cenário: Comprar um produto
    Dado que eu esteja logado
    Quando eu adiciono um produto no carrinho
    E eu finalizo a compra
    Então o sistema registra o meu pedido


