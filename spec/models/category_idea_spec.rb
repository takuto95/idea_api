require 'rails_helper'

RSpec.describe CategoryIdea, type: :model do
  before do
    @category_idea = FactoryBot.build(:category_idea)
  end

  describe 'アイディアの保存' do
    context 'アイディアが保存できる場合' do
      it 'カテゴリ名とアイディア名があれば保存される' do
        expect(@category_idea).to be_valid
      end
    end
    context 'アイディア名が保存できない場合' do
      it 'アイディア名がないと保存できない' do
        @category_idea.body = ' '
        @category_idea.valid?
        expect(@category_idea.errors.full_messages).to include("Body can't be blank")
      end
    end
  end
end
