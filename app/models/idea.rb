class Idea < ApplicationRecord
  belongs_to :category

  def self.search(search)
    ideas = []
    category_box = []

    if search != ''
      if Category.find_by(name: search)
        category_box = Category.where(name: search)
        category_box.each do |category|
          ideas << Idea.find(category.id)
        end
      else
        ideas = ''
      end
    else
      ideas = Idea.all
    end
    ideas
  end
end
