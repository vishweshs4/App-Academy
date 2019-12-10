class AlbumsController < ApplicationController 

  def show 
    @album = Album.find(params[:id]) 
    render :show 
  end 

  def create 
    @album = Album.new(album_params) 

    if @album.save 
      redirect_to album_url(@album) 
    else
      render :new
    end
  end 

  def edit 
    @album = Album.find(params[:id]) 
    render :edit
  end 

  def update 
    @album = Album.find(params[:id]) 
    
    if @album.update_attributes(album_params) 
      redirect_to album_url(@album) 
    else 
      render :edit
    end
  end 

  def destroy 
    @album = Album.find(params[:id]) 
    @album.destroy 
    redirect_to new_band_album_url(@album.band_id)
  end 

  def new 
    @album = Album.new(band_id: params[:band_id])
    @band = Band.find(params[:band_id])
    render :new
  end 

  def album_params 
    params.require(:album).permit(:title, :year, :band_id, :live)
  end 
end 
