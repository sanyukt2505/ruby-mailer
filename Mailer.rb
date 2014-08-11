require 'sinatra'
require 'json'
require 'pony'

get '/' do
  'Hello Mailer!'
end

#Post to send the email

post '/' do
  params = JSON.parse request.body.read
  begin
      Pony.mail({
      :from => 'noreply@example.com',
          :to => "#{params['to']}",
          :subject => "#{params['subject']}",
          :body => "#{params['body']}",
        :via => :smtp,
          :via_options => {
            :address        => 'mailtrap.io',
            :port           => '2525',
            :user_name      => '228774eac31a978aa',
            :password       => '18835f1dae148a',
            :authentication => :plain, 
            :domain         => "mailtrap.io" 
          }
          })
        rescue Exception => e  
          puts e.message  
          puts e.backtrace.inspect   
      end 
  puts
end