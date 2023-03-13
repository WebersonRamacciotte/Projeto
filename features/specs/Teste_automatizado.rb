#language: pt

Dado("que eu acesse a tela de login") do
  visit "https://www.saucedemo.com/"
end

Quando("eu efetuo login no sistema") do
  fill_in "user-name", with: "standard_user"
  fill_in "password", with: "secret_sauce"
  click_button "Login"
end

Então("o sistema me redireciona para a página de produtos") do
  expect(page).to have_current_path("https://www.saucedemo.com/inventory.html")
end

Quando("eu tento efetuar login com credenciais inválidas") do
  fill_in "user-name", with: "invalid_user"
  fill_in "password", with: "invalid_password"
  click_button "Login"
end

Então("o sistema não permite o login") do
  expect(page).to have_current_path("https://www.saucedemo.com/")
end

E("o sistema apresenta uma mensagem de erro") do
  expect(page).to have_css(".error-message-container")
end

Dado("que eu esteja logado") do
  visit "https://www.saucedemo.com"
  fill_in "user-name", with: "standard_user"
  fill_in "password", with: "secret_sauce"
  click_button "Login"
end

Quando("eu adiciono um produto no carrinho") do
  first("button.btn_primary").click
end


E("eu finalizo a compra") do
  find(".shopping_cart_link").click
  click_button "Checkout"
  fill_in "first-name", with: "Weberson"
  fill_in "last-name", with: "Ramacciotte"
  fill_in "postal-code", with: "7460480"
  click_button "Continue"
  click_button "Finish"
end

Então("o sistema registra o meu pedido") do
  sleep 2
  expect(page).to have_text("Thank you for your order!")
  end