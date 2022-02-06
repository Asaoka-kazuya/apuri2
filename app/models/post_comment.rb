class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_image
  #userもpostimageも関連つけられるのはひとつのためbelongs_towを使う
end
