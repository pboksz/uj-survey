class Admin < ActiveRecord::Base
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, :password_confirmation, length: { minimum: 8 }
  validate :passwords_must_match

  before_save :cleanup_passwords

  attr_reader :password, :password_confirmation

  def password=(new_password)
    @password = new_password
    self.encrypted_password = password_encryptor.encrypt_password(new_password)
  end

  def password_confirmation=(new_password)
    @password_confirmation = new_password
  end

  def valid_password?(password)
    password_encryptor.compare_passwords?(password, encrypted_password)
  end

  private

  def passwords_must_match
    unless @password == @password_confirmation
      errors[:password] << ''
      errors[:password_confirmation] << ''
    end
  end

  def cleanup_passwords
    @password = @password_confirmation = nil
  end

  def password_encryptor
    @password_encryptor ||= PasswordEncryptor.new
  end
end
