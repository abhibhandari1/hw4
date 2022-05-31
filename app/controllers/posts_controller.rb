class PostsController < ApplicationController

  def new
    if @current_user
      @post = Post.new
      @post.place_id = params["place_id"]
    else
      flash["notice"] = "Login to Post"
      redirect_to "/sessions/new"
    end
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = session["user_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end
