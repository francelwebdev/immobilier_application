class Newsletter < ApplicationRecord
    validates :email_address, presence: true
    validates :email_address, uniqueness: { message: "L'adresse email existe déja !" }

    before_save :downcase_email
    after_save :subscribe

    def downcase_email
        self.email_address = email_address.downcase      
    end

    def subscribe
        gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
        list_id = Rails.application.secrets.mailchimp_list_id_key
        begin 
      gibbon.lists(list_id).members.create( 
      body: { 
        email_address: self.email_address,
        status: "subscribed" 
      }) 
    rescue Gibbon::MailChimpError => e 
      puts "Try Again: #{e.message} ‐ #{e.raw_body}" 
    end
    end
end
