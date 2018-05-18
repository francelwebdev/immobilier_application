class Newsletter < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: { message: "L'adresse email existe déja !" }

    before_save :downcase_email
    after_save :subscribe

    def downcase_email
        self.email = email.downcase
    end

    def subscribe
        gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
        list_id = Rails.application.secrets.mailchimp_list_id_key
        begin 
      gibbon.lists(list_id).members.create( 
      body: { 
        email: self.email,
        status: "subscribed" 
      }) 
    rescue Gibbon::MailChimpError => e 
      puts "Try Again: #{e.message} ‐ #{e.raw_body}" 
    end
    end
end
