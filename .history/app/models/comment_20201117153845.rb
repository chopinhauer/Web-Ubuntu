class Comment < ApplicationRecord
   
  validates :comment , presence:true , length:{minimum:3, maximum:15}
  belongs_to :article
  belongs_to :user

end
