class Api::AlbumsController < ApplicationController
	before_action :require_user!

  def index
  	@albums = albums_in_desc
  end

  def create
    debugger
    title = params[:title].blank? ? "No Title" : params[:title]
    description = params[:description] || ""
    picture_urls = params[:urls]
    picture_urls = JSON.parse(picture_urls) if picture_urls

    @album = current_user.albums.new(title: title, description: description);

    if @album.save
      if picture_urls
        ActiveRecord::Base.transaction do
          picture_urls.each do |url|
            @album.pictures.create(picture_url: url['url'], public_id: url['public_id'])
          end
        end
      end

      render json: @album
    else
      # TODO: oops.. something went wrong
    end
  end

  def show
  	@album = Album.find(params[:id])

  	if @album
  		@pictures = @album.pictures
  	else
  		# TODO: page not found
  	end
  end

  def update
    @album = Album.find(params[:id])

    if @album
      @album.title = params[:title] unless params[:title].blank?
      @album.description = params[:description] unless params[:description].blank?
      unless params[:urls].blank?
        picture_urls = params[:urls]
        picture_urls = JSON.parse(picture_urls)
      end

      if @album.save
        @albums = albums_in_desc
        if picture_urls
          ActiveRecord::Base.transaction do
            picture_urls.each do |url|
              @album.pictures.create(picture_url: url['url'], public_id: url['public_id'])
            end
          end
        end

        render :index
      else
        # TODO: oops.. something went wrong
      end
    else
      redirect_to home_url
    end
  end

  def destroy
    album = Album.find(params[:id])

    if album
      album.pictures.each do |pic|
        Cloudinary::Uploader.destroy(
          pic.public_id,
          api_key: ENV['api_key'],
          api_secret: ENV['api_secret'],
          cloud_name: ENV['cloud_name']
        )
      end

      album.destroy
      @albums = albums_in_desc
      render :index
    else
      # TODO: page not found
    end
  end

  private
  def albums_in_desc
    current_user.albums.all.order('updated_at DESC')
  end
end
