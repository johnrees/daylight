Daylight::Application.routes.draw do

  resources :clients

  resources :videos, except: :index

  %w(work light_work).each do |page|
    get "#{page.gsub('_', '-')}(/:category)", to: "videos##{page}", as: page
  end

  %w(featured showreel).each do |page|
    get page.gsub('_', '-'), to: "videos##{page}", as: page
  end

  %w(home about).each do |page|
    get page, to: "static##{page}"
  end

  namespace :admin do
    root to: 'admin#dashboard'
  end

  root to: "static#home"
end
