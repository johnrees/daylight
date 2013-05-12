Daylight::Application.routes.draw do

  %w(home about).each do |page|
    get page, to: "static##{page}"
  end

  root to: "static#home"
end
