#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base # это модель, а не сущность
	validates :name, presence: true # это хэш 
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.order "created_at DESC"
end

get '/' do
	erb :index #вид
end

get '/visit' do
	erb :visit
end

post '/visit' do

	c = Client.new params[:client]
	c.save
	
	# @username = params[:username]
	# @phone = params[:phone]
	# @datetime = params[:datetime]
	# @barber = params[:barber]
	# @color = params[:color]

	# # name, phone, datestamp, barber, color
	# c = Client.new
	# c.name = @usernamec
	# c.phone = @phone
	# c.datestamp = @datetime
	# c.barber = @barber
	# c.color = @color
	# c.save

	erb "<h2>Спасибо, вы записались!</h2>"
end

