class Users::RegistrationsController < Devise::RegistrationsController
    
    def create
        #imports create action code from default devise registration controller and then add to it
        super do |resource|
            if params[:plan]
            # assigns the plan id parameter sent in the form to the user's plan id (user database has a field for plan id)
            resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_payment
                else
                    resource.save
                end
            end
        end
    end
end