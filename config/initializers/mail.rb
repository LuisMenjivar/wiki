if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {

    port:              587, 
    address:           'smtp.mailgun.org',
    user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    password:          ENV['MAILGUN_SMTP_PASSWORD'],
    domain:            'herokuapp.com',
    authentication:    :plain,
    content_type:      'text/html'
  }
end

# This interceptor just makes sure that local mail 
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'luistodolist@mail.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out

if Rails.env.development?
  ActionMailer::Base.raise_delivery_errors = true# Makes debugging *way* easier.
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end