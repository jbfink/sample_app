# == Schema Information
# Schema version: 20101216193204
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
            :format => { :with => email_regex },
	    :uniqueness => { :case_sensitive => false }
 #automatically create the virtual attribute 'password confirmation'.
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

end
