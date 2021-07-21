Rails.application.routes.draw do
  root "data_set#index"

  get "/data", to: "data_set#dataJSON"
  get "/loadcsv", to: "data_set#loadcsv"
  get "/deletecsv", to: "data_set#deletecsv"

end
