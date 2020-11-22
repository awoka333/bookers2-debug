class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	end
	
	def self.search(how, word)
		if how == "1"
			@book = Book.where("#{word}")
        elsif how == "2"
            @book = Book.where("title LIKE ?", "#{word}%")
        elsif how == "3"
            @book = Book.where("title LIKE ?", "%#{word}")
        elsif how == "4"
            @book = Book.where("title LIKE ?", "%#{word}%")
        else
            @book = Book.all
        end
    end

end
