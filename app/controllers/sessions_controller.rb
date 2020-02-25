class SessionsController < Devise::SessionsController
    def destroy
        super
        new_user_session_path
      end


end
