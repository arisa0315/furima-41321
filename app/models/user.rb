class User < ApplicationRecord

  has_many :orders
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: { message: "can't be blank" }
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d-]+\z/i,
                      message: 'is invalid. Include both letters, numbers, and hyphens' }
  validates :first_name, presence: { message: "can't be blank" },
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name, presence: { message: "can't be blank" },
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana,
            presence: { message: "can't be blank" },
            format: { with: /\A[ァ-ヶー-]+\z/,
                      message: 'is invalid. Input full-width katakana characters, hyphen, and long vowel sound' }
  validates :last_name_kana, presence: { message: "can't be blank" },
                             format: { with: /\A[ァ-ヶー-]+\z/,
                                       message: 'is invalid. Input full-width katakana characters, hyphen,'\
                                'and long vowel sound' }
  validates :birth_date, presence: { message: "can't be blank" }
end
