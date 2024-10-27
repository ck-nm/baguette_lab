class Post < ApplicationRecord
  belongs_to :user, class_name: "Public", foreign_key: "public_id"
end
