class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def profile
    @my_listings = current_user.listings #means i log in, i click on see my profile, i want to see only my posted listings, i do not want to see other's listings

    #app/views/listings/profile.html.erb
  end

  #create-new
  def new
    #run all the logics here before loading app/listings/new.html.erb
    @listing = Listing.new
  end

  #create-create
  def create #post '/listings' do
    @listing = current_user.listings.new(listing_params)
    if @listing.save #happy path
      redirect_to @listing
      # redirect_to listing_path(@listing)
    else
      render :new

      #because rails know i m doing sth abt listings, so rails will go to app/views/listings/new.html.erb

      # #the difference between render :new and
      # redirect_to new_listing_path is:

      # 1) render :new will just load the erb straight away
      # 2) redirect_to new_listing_path, it will go to the new action in this controller and render new.html.erb after that
    end
  end

  #READ-SHOW
  def show


  end

  #READ-INDEX
  def index #app/views/listings/index.html.erb
    @listings = Listing.all
  end


  #EDIT-EDIT
  def edit

 #to find out which listing i want to edit

    if @listing.user == current_user
      render :edit
    else
      redirect_to sign_in_path
    end

    #it will then render out my 'app/views/listings/edit.html.erb'
  end

  #EDIT-UPDATE
  def update

    @listing.update(listing_params)

    if @listing.save #happy path
      redirect_to @listing #the show page
    else #unhappy path
      render :edit #render back edit.html.erb again
    end

  end

  #DELETE
  def destroy

    @listing.destroy
    redirect_to listings_path #read-index page that shows all my listings
  end

  private #in future, when i apply testing in rspec, i do not want to launch testing on these private methods (not necessarily)

    def listing_params #i m doing a white permitted list of parameters to enter my listing object
      params.require(:listing).permit(:name, :description)
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end


  # post '/listings' do
  #   @listing = current_user.listings.new(params[:listing])
  #   if @listing.save #happy path
  #     redirect to '/listings/#{@listing.id}'
  #   else
  #     render :"listings/new"
  #   end
  # end
end
