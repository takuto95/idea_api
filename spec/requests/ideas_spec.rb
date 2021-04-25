require 'rails_helper'
describe IdeasController, type: :request do
  describe 'GET' do
    it 'リクエスト成功を表す200が返ってきたか確認する。' do
      get ideas_path
      expect(response.status).to eq 200
    end
  end

  describe 'POST' do
    it 'アイディア名が保存されていることを確認する。' do
      params = { name: 'testname', body: 'testbody' }
      expect { post ideas_path, params: params }.to change(Idea, :count).by(+1)
      expect(response.status).to eq 200
    end

    it 'カテゴリー名が保存されていることを確認する。' do
      params = { name: 'testname', body: 'testbody' }
      expect { post ideas_path, params: params }.to change(Category, :count).by(+1)
      expect(response.status).to eq 200
    end
  end
end
