class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # validates :name, presence: true, length: { minimum: 2 }
  # bookにとって1である
  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  
  
  def get_profile_image(width, height)
    # もしプロフィール画像がまだなければ
    unless profile_image.attached?
      # 以下のpathの画像を表示する
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # nameの文字数を最低２，最高２０、名前は一意設定
  validates :name,  {uniqueness: true, length: {minimum: 2, maximum: 20}}
  # introductionの文字数を最高５０にした
  validates :introduction, length: {maximum: 50}
  
 
end
