module AuthenticatableByToken
  extend ActiveSupport::Concern

  included do
    attr_encrypted :authentication_token, :key => "x8mn%f348 2/md@(#$LoLN"
    before_save :ensure_authentication_token
  end
  
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
 
  def reset_authentication_token!
    self.authentication_token = generate_authentication_token
    self.save
  end

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_authentication_token(token)
    end
  end

end