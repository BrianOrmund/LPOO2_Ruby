Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Página inicial: action index do controller contatos
  root "menu#index"

  # Mapeia as rotas do CRUD para a entidade Contatos
  resources :professores
  resources :alunos
  resources :disciplinas
  
  
end
