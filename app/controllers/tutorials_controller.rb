class TutorialsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  #before_filter :find_user, :except => [:index, :show]
  before_filter :is_owner, :only => [:edit, :update, :destroy]
  respond_to :html
  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tutorials }
    end
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @tutorial = Tutorial.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/new
  # GET /tutorials/new.json
  def new
    @tutorial = Tutorial.new
   respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
        @tutorial  = current_user.tutorials.build(params[:tutorial])
   # @tutorial = current_user.tutorials.new(params[:tutorial])

           respond_to do |format|
              if @tutorial.save
                format.html { redirect_to @tutorial, notice: 'Post was successfully created.' }
                format.json { render json: @tutorial, status: :created, location: @post }
              else
                format.html { render action: "new" }
                format.json { render json: @tutorial.errors, status: :unprocessable_entity }
              end
            end
          end
#@tutorial = current_user.posts.build(params[:post])
# @tutorial = current_user.tutorials.new(params[:tutorial])
# @tutorial.save
#     respond_to do |format|
#       if @tutorial.save
#         format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
#         format.json { render json: @tutorial, status: :created, location: @tutorial }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @tutorial.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  # PUT /tutorials/1
  # PUT /tutorials/1.json
  
  def update
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url }
      format.json { head :ok }
    end
  end
  


  
  private
      def is_owner 
        tutorial = Tutorial.find(params[:id])
        unless user_signed_in? && @user == current_user
          redirect_to(tutorial, :notice => 'You cannot edit an entry that you did not create.')
        end
      end
  
  
end