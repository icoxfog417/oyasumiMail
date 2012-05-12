class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  before_filter :authenticate_user!

  def index
    #@messages = Message.all
    @messages = Message.where("user_id = ?" , current_user.id).all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @message.message_attribute = MessageAttribute.new
    @message.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
    
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.message_attribute = MessageAttribute.new
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
    
    if current_user.id = @message.user_id 
      @message.attributes = params[:message]
    else
      if @message.evaluate == nil 
        @message.evaluate = 1
      else
        @message.evaluate +=1
      end
    end
    
    respond_to do |format|
      #if @message.update_attributes(params[:message])
      if @message.save
        #format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.html { redirect_to messages_url, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.where("user_id = ?" , current_user.id).find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
