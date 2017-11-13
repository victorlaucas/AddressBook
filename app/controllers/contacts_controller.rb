class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :authorize_user, only: [:update, :edit, :destroy]

  access all: [:show, :index], user: [:edit, :update, :destroy, :new, :create], admin: :all





  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.sort_by_name
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @auth 
      respond_to do |format|
        if @contact.update(contact_params)
          format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    else 
      redirect_to contacts_path, notice: "You are not authorized"
    end 
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
def destroy
  if @auth
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end 
  else 
    redirect_to contacts_path, notice: "You are not authorized"
  end 
end

  private
    # Use callbacks to share common setup or constraints between actions.
     
   def authorize_user
    @auth = current_user.id == @contact.user_id || current_user.roles == [:admin, :user]
   end


    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :address, :email, :phone)
    end
end
