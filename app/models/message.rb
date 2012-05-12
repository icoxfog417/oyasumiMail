class Message < ActiveRecord::Base
  attr_accessible :body, :evaluate, :title
  belongs_to :user
  has_one :message_attribute
end
