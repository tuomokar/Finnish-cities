class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings

  validates :username, :presence => false,
            :uniqueness => { :message =>  :not_unique },
            :length => { minimum: 3, :message => :username_too_short }

  validates :password, :presence  => false,
            :length => { minimum: 6, :message => :password_too_short }

  validates_format_of :password, with: /(?=.*\d)(?=.*([A-Z]))/, :message => :one_capital_and_letter
end

