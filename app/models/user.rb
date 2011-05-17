class User < ActiveRecord::Base
  require 'bcrypt'
  attr_reader   :password

  validates_confirmation_of :password
  validates_presence_of     :password_digest
  
  def self.attributes_protected_by_default
    super + ['password_digest']
  end
  
  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  # Encrypts the password into the password_digest attribute.
  def password=(unencrypted_password)
    @password = unencrypted_password
    unless unencrypted_password.blank?
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end
end
