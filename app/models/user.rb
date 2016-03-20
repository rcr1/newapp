# class User < ActiveRecord::Base
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable
#   belongs_to :plan
#   # Allows us to access stripe card token used in the javascript in users.js
#   attr_accessor :stripe_card_token
  
#   def save_with_payment
#     # tests any validations that are used
#     if valid?
#       # gets stripe gem to send out information to stripe, creating customer and charging customer
#       customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
#       # stripe returns an id to us for the particular customer, which is then saved
#       self.stripe_customer_token = customer.id
#       save!
#     end
#   end
# end



class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end


