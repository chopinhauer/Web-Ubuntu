class Comment < ApplicationRecord
  validates :name , presence:true , length:{minimum:3, maximum:20}
  belongs_to :article
end
