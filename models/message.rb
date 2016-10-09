class Message < ActiveRecord::Base
  require 'twilio-ruby'

  @@account_sid = 'PNbc745459644576a5929e269ab18a6a81'
  @@auth_token = '274e8b25ae3394c74a06939a7293a83d'
  @@from_number = '+13103599489'

  def send
    puts "Sending SMS message, to: #{self.to_number}, message: #{self.message}"

    client.messages.create({
      from: @@from_number,
      to: self.to_number,
      body: self.message
    })

    self.sent = true
    self.save
  end

  private
    def client
      return @client if @client

      @client = Twilio::REST::Client.new @@account_sid, @@auth_token
    end

end