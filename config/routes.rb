Daylight::Application.routes.draw do

  resources :clients, only: :index
  resources :videos, except: :index

  namespace :admin do
    resources :videos
    resources :clients
    root to: 'videos#index'
  end

  %w(work light_work).each do |page|
    get "#{page.gsub('_', '-')}(/:category)", to: "videos##{page}", as: page
  end

  %w(featured showreel).each do |page|
    get page.gsub('_', '-'), to: "videos##{page}", as: page
  end

  %w(home about).each do |page|
    get page, to: "static##{page}"
  end

  root to: "static#home"
end
