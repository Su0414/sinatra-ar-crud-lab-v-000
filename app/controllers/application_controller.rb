
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  #CREATE Action

    get '/posts/new' do
      erb :new
    end

    post '/posts' do
      puts params
      @post = Post.new(name: params[:name],content: params[:content])
      @post.save
      erb :index
    end

    #READ

    get '/posts' do
      @posts = Post.all
      erb :index
    end

    get "/posts/:id" do
      @post = Post.find_by(params[:id])
      erb :show
    end

    #Update

      get "/posts/:id/edit" do
        #binding.pry
        @post = Post.find(params[:id])
        erb :edit
      end

      patch "/posts/:id" do
        @post = Post.update(name: params[:name], content: param[:content])
        @post.save
        erb :show
      end

    # DELETE
    delete "/posts/:id/delete" do
      @post = Post.where(id: params[:id]).destroy_all
      puts @post.name
      erb :delete
    end

end
