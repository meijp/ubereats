class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  # def self.search(search) #self.でクラスメソッドとしている
  #   if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
  #     Store.where(['address LIKE ?', "%#{search}%"])
  #   else
  #     Store.all #全て表示。
  #   end
  # end

  has_many :products

end
