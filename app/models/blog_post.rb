class BlogPost < ApplicationRecord
  #This is a validation, if the label is blank
  validates :title, presence: true
  validates :body, presence: true
end
