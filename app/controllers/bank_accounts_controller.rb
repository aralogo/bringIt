class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [ :index, :edit, :update, :destroy]
  
  # GET /bank_accounts
  # GET /bank_accounts.json
  def index
    @bank_accounts = BankAccount.all
  end

  # GET /bank_accounts/1
  # GET /bank_accounts/1.json
  def show
  end

  # GET /bank_accounts/new
  def new
    @bank_account = BankAccount.new
  end

  # GET /bank_accounts/1/edit
  def edit
  end

  # POST /bank_accounts
  # POST /bank_accounts.json
  def create
    @bank_account = BankAccount.new(bank_account_params)

    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully created.' }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_accounts/1
  # PATCH/PUT /bank_accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_accounts/1
  # DELETE /bank_accounts/1.json
  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.html { redirect_to bank_accounts_url, notice: 'Bank account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_account_params
      params.require(:bank_account).permit(:ISBN, :accountHolder, :userID_id)
    end
    
    def authenticate_admin!
      if current_user
        # the user is signed in
        if !current_user.isAdmin?
          # registered user but not an admin!
            if params[:id].present?  #check for the case that try to go to index (for gral display)
              unless @bank_account.userID_id == current_user.id
              #trying crud in not your things 
                flash[:notice] = 'Access denied as you are not owner of this data'
                redirect_to root_path 
              end 
            else
              flash[:notice] = 'You are not admin!!'
                redirect_to root_path 
            end
        end
      else
        redirect_to :new_user_session
        flash[:notice] = 'You need to login to continue'
      end
    end
end
