require 'rubygems'

gem 'json'
require 'json'
require 'ruport'

class RuportJsonFormatter < Ruport::Formatter
  renders :json, :for => Ruport::Controller::Table

  def layout
    output << "[\n" 
    yield
    output << "]" 
  end

  def build_table_header
    output << build_row(data.column_names)
    output << ",\n" # add a comma for the delimiter for the next row...
  end

  def build_table_body
    buffer = []
    data.each { |r| buffer << build_row(r) }
    output << buffer.join(",\n")
  end

  def build_row(row)
    row.to_a.to_json
  end
end