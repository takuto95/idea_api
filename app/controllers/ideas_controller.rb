class IdeasController < ApplicationController
  def index
    index_box = []
    ideas = Idea.all
    ideas.each do |idea|
      category = Category.find(idea.category_id)
      idea_box = { id: idea.id, category: category.name, body: idea.body }
      index_box << idea_box
    end
    render json: { data: index_box }
  end

  def search
    ideas = Idea.search(params[:keyword])
    if ideas != ''
      render json: { data: ideas }
    else
      render json: { status: 422 }
    end
  end

  def create
    @category_idea = CategoryIdea.new(category_params)
    if @category_idea.valid?
      @category_idea.save
      render json: { status: 201 }
    else
      render json: { status: 422 }
    end
  end

  private

  def category_params
    params.permit(:name, :body)
  end
end
