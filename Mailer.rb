require 'sinatra'
require 'json'
require 'pony'

get '/' do
  'Hello Appa!'
end

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
            :user_name      => 'my_user_name',
            :password       => 'my_password',
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