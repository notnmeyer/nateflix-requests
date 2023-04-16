class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :authored_comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum role: { standard: 0, admin: 1 }

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :standard
  end
end
