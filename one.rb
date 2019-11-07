require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'haml'
require 'pg'
require 'securerandom'
require 'sinatra/reloader'
require 'digest'
require './models/message.rb'
require './services/params_converter.rb'
require './environments'
# set :database_file, 'config/database.yml'

class One < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/create' do
    Message.new(params[:message]).tap do |m|
      m.created_at = Time.now
      m.identificator = Digest::MD5.hexdigest(m.title)
      m.save
    end
    redirect :list
  end

  get '/message/:id' do
    @message = Message.find_by_identificator(params[:id])
    @message.update_attributes(visits: @message.visits - 1) if @message&.visited

    if @message
      @message.delete if @message&.delete_message?
      haml :show
    else
      haml :nocontent
    end
  end

  get '/list' do
    @messages = Message.all
    haml :list
  end

  post '/destroy' do
    message = Message.find(params[:id])
    @params = ParamsConverter.new(params).attributes
    @messages = Message.all
    message.update_attributes(@params)
    haml :list
  end
end
