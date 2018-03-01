class EmailsController < ApplicationController


  def index
    @emails = Email.all
 
    end

  def show
        @email = Email.find(params[:id])

    respond_to do |format|
      format.html 
      format.js  

  end

  end

  def destroy
      
    @email = Email.find(params[:id])



    if @email.destroy
      flash[:notice] = "Task Completed."
      
    else
      flash[:error] = "Task couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  private
  def email_params
    params.require(:email).permit(:object, :body, :read)
  end


end