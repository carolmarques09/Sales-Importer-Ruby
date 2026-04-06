require 'sinatra'
require 'active_record'
require 'yaml'
require './app/services/import_sales'
require './app/models/init'

# DB config via YAML
config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(config['development'])

get '/' do
  <<-HTML
  <h2>Upload .tab File</h2>
  <form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <button type="submit">Upload</button>
  </form>
  HTML
end

post '/upload' do
  file = params[:file][:tempfile]
  total = ImportSales.call(file)

  "Total Gross Income: #{total}"
end
