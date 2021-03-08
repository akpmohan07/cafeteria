Rails.application.routes.draw do
  get 'myCoffees',to: 'coffees#list'
  get 'newCoffee',to: 'coffees#add'
  get 'login',to: 'coffees#login'
  post 'auth',to: 'coffees#auth'
  get 'auth',to: 'coffees#auth'
  post 'addCoffee',to: 'coffees#addCoffee'
  get 'addCoffee',to: 'coffees#auth'
  get 'delete/:id',to: 'coffees#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end
