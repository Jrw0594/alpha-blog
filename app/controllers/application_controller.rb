class ApplicationController < ActionController::Base

    #helper method makes it viewable by controller and views
    helper_method :current_user
    def current_user
        #checks for current user fist then does the other if not found
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :logged_in?
    def logged_in?
        #turn current user too boolean
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end

end
