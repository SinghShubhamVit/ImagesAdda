# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :image_infos, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
    [firstname, lastname].join(' ')
  end
end
