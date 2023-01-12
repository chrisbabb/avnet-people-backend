Rails.application.routes.draw do
  get 'corp_events/index'
  resources :users, :logos, :people, :corp_events, :event_links
end
