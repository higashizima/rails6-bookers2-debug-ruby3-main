class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(search_word, method)
    if method == 'perfect'
      Book.where(title: search_word)
    elsif method == 'forward'
      Book.where('name LIKE ?', search_word + '%')
    elsif method == 'backward'
      Book.where('name LIKE ?', '%' + search_word)
    else
      Book.where('name LIKE ?', '%' + search_word + '%')
    end
  end
end
