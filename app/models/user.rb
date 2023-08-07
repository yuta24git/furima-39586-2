class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'must be full-width characters' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'must be full-width characters' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be full-width katakana characters' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be full-width katakana characters' }
  validates :birth_date, presence: true
  validate :password_complexity


  private

  def password_complexity
    return if password.blank?

    unless password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)
      errors.add :password, 'must include both letters and numbers'
    end
  end

end
