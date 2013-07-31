Daylight::Application.routes.draw do

  resources :clients, only: :index
  resources :videos, except: :index

  get 'contact', to: 'static#contact'

  namespace :admin do
    %w(videos tags clients homepage_videos featured_videos).each do |resource|
      resources resource do
        put :sort, on: :collection
      end
    end
    root to: 'videos#index'
  end

  %w(work light_work).each do |page|
    get "#{page.gsub('_', '-')}(/:tag)", to: "videos##{page}", as: page

    get "#{page.gsub('_', '-')}/:tag/:id", to: "videos#show", as: "full_#{page}"
  end

  %w(featured showreel).each do |page|
    get "#{page}(/:id)", to: "videos##{page}", as: page
  end

  %w(home about).each do |page|
    get page, to: "static##{page}"
  end

  root to: "static#home"
end
