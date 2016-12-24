class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    [first_name, last_name].compact.join(' ')
  end

  after_create :subscribe
  
	def subscribe
		gibbon = Gibbon::Request.new(api_key: ENV['mailchimp_api_key'])
		list_id = ENV['mailchimp_list_id']
		gibbon.lists(list_id).members.create(body: {email_address: self.email, status: "subscribed", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
	end
end
