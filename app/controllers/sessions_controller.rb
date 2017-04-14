class SessionsController < ApplicationController

  def new
  end

     def create
      
         user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
          #���[�U�[���O�C����Ƀ��[�U�[���̃y�[�W�Ƀ��_�C���N�g����
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)   
          redirect_to user            
       else
           flash.now[:danger] = 'Invalid email/password combination'   
            #�G���[���b�Z�[�W���쐬����
           render 'new'
      
       end
      
     end

  def destroy
  
    log_out if logged_in?
    redirect_to root_url
  
  end
end
