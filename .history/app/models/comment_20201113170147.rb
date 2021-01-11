class Comment < ApplicationRecord
  validates :name , presence:true , length:{minimum:3, maximum:15}
  validates :text , presence:true , length:{minimum:3, maximum:15}
  belongs_to :article
end
