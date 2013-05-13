Daylight::Application.routes.draw do

  resources :clients

  resources :videos, path: 'work'

  %w(light_work featured showreel).each do |page|
    get page.gsub('_', '-'), to: "videos##{page}", as: page
  end

  %w(home about).each do |page|
    get page, to: "static##{page}"
  end

  root to: "static#home"
end
