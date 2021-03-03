class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/,
  message: "不符合 email 規則" }
  validates :password, presence: true, confirmation: true, length: { in: 6..12 }
  before_create :encrypt_password

  def self.login(user)
    pw = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email],password: pw)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z") 
  end
end
