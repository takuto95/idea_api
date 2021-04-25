class CategoryIdea
  include ActiveModel::Model
  attr_accessor :name, :body

  with_options presence: true do
    validates :name
    validates :body
  end

  def save
    if Category.find_by(name: name)
      category = Category.find_by(name: name)
      Idea.create(category_id: category.id, body: body)
    else
      category = Category.create(name: name)
      Idea.create(category_id: category.id, body: body)
    end
  end
end
