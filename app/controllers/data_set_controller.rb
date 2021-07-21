require 'csv'


class DataSetController < ApplicationController
  def index

  end

  def deletecsv
    DataSet.delete_all
  end

  def loadcsv
    # if this file has already loaded, make sure that it doesn't get imported twice.
    if DataSet.count == 0 then
      filename = "private/coding-challenge.csv"
      CSV.foreach(filename, headers: true) do |row|
        DataSet.create!(row.to_hash)
      end
    end    
  end

  def dataJSON
    # created with "ruby bin/rails console" tinkering
    render json: {:Education => DataSet.group("EDUCATION").count, 
                  :"ESTIMATED INCOME" =>DataSet.group("ESTIMATED INCOME").count
                  # ,:"ZIP CODE" =>DataSet.group("ZIP CODE").count
                }.to_json
  end
end
