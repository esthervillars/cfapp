class UserMailer < ApplicationMailer
	default from: "tony361@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
					:to => 'tony361@gmail.com',
					:subject => "A new contact from message from #{name}")
	end

	def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  UserMailer.contact_form(@email, @name, @message).deliver_now
	end

end
