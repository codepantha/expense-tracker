# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :groups, only: [:index, :show, :new, :create] do
    resources :expenses, only: [:index]
  end
end
