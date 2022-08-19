# frozen_string_literal: true

Rails.application.routes.draw do
  get 'health' => 'application#healthcheck'

  namespace :api do
    namespace :v1 do
      get 'sports', to: 'sports#index'
      get 'sports/:sport_id', to: 'events#index'
      get 'sports/:sport_id/events/:event_id', to: 'outcomes#index'
    end
  end
end
