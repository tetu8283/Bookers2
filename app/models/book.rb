class Book < ApplicationRecord
    has_one_attached :image
    # userにとってNである
    belongs_to :user
    
    def get_image
        # もしプロフィール画像がまだなければ
        unless image.attached?
        # 以下のpathの画像を表示する
          file_path = Rails.root.join('/Bookers2app/assets/images/no-image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
    end
    
    # titleは必須項目
    validates :title, presence: true
    # bodyは空でなく、２００以下
    validates :body, {presence: true, length: {maximum: 200}}
end
