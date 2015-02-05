class UrlsController < ApplicationController
  def index
    if params[:popularity]
      @urls = Url.sorted_by_popularity
    else
      @urls = Url.sorted_by_created_date
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    if @url.save
      redirect_to root_path
    else
      render :new, notice: "Something went wrong!"
    end
  end

  def show
    @url = Url.find_by(slug: params[:slug])
    if @url
      redirect_to @url.given_url
      @url.increment_hits
    end
  end

  private

  def url_params
    params.require(:url).permit(:given_url)
  end
end
