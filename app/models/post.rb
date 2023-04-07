class Post < ApplicationRecord
    has_many :comments, :dependent => :delete_all
    has_many :likes, as: :likeable, :dependent => :delete_all
end
