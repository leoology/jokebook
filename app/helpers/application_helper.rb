module ApplicationHelper
    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def logged_in?
        !!session[:comedian_id]
    end

    def current_user
        @current_user ||= Comedian.find_by_id(session[:comedian_id]) if session[:comedian_id]
    end

    def redirect_if_logged_in
        redirect_to jokes_path if logged_in?
    end

    def if_errors(object)
        render partial:"comedians/errors", locals:{object:object} if object.errors.any?
    end

end
