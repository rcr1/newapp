module UsersHelper
    
    def job_title_icon
        case @user.profile.job_title
        when "Developer"
            return "<i class='fa fa-code'></i>".html_safe
        when "Investor"
            return "<i class='fa fa-money'></i>".html_safe
        when "Entrepreneur"
            return "<i class='fa fa-android'></i>".html_safe
        end
    end
end