Rails.application.routes.draw do
  root 'welcome#index'
  get '/toyota' => 'welcome#toyota'
end
