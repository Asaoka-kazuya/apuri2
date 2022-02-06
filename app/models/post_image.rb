class PostImage < ApplicationRecord

  has_one_attached :image

   belongs_to :user
   #Postimageモデルに関連つけられるuserは１つ
   
   has_many :post_comments, dependent: :destroy
   #has_manyでPostCommentを複数持つことを表している
   has_many :favorites, dependent: :destroy

    def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
    
    def favorited_by?(user)
    favorites.exists?(user_id: user.id)
    end

    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    end
end
