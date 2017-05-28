require 'rails_helper'

describe CommentsController, type: :controller do
  let!(:blog) { create(:blog) }

  describe 'create' do
    describe 'Basic comment creation' do
      let(:article) { create(:article) }
      let(:comment) { { body: 'content', author: 'bob', email: 'bob@home', url: 'http://bobs.home/' } }

      before { post :create, params: { comment: comment, article_id: article.id } }

      it { expect(assigns[:comment]).to eq(Comment.find_by(author: 'bob', body: 'content', article_id: article.id)) }
      it { expect(assigns[:article]).to eq(article) }
      it { expect(article.comments.size).to eq(1) }
      it { expect(article.comments.last.author).to eq('bob') }
      it { expect(cookies['author']).to eq('bob') }
      it { expect(cookies['gravatar_id']).to eq(Digest::MD5.hexdigest('bob@home')) }
      it { expect(cookies['url']).to eq('http://bobs.home/') }
    end

    it 'should redirect to the article' do
      article = create(:article, created_at: '2005-01-01 02:00:00')
      post :create, params: { comment: { body: 'content', author: 'bob' }, article_id: article.id }
      expect(response).to redirect_to article.permalink_url
    end
  end

  describe 'AJAX creation' do
    it 'should render the comment partial' do
      post :create, xhr: true, params: { comment: { body: 'content', author: 'bob' }, article_id: create(:article).id }
      expect(response).to render_template('articles/comment')
    end
  end

  describe 'index' do
    context 'scoped index' do
      let(:article) { create(:article) }
      before(:each) { get 'index', params: { article_id: article.id } }
      it { expect(response).to redirect_to("#{article.permalink_url}#comments") }
    end

    context 'without format' do
      before(:each) { get :index }
      it { expect(response).to be_success }
      it { expect(assigns(:comments)).to be_nil }
    end

    context 'with atom format' do
      context 'without article' do
        let!(:some) { create(:comment) }
        let!(:items) { create(:comment) }

        before(:each) { get 'index', params: { format: 'atom' } }

        it { expect(response).to be_success }
        it { expect(assigns(:comments)).to eq([some, items]) }
        it { expect(response).to render_template('index_atom_feed') }
      end

      context 'with an article' do
        let!(:article) { create(:article) }
        before(:each) { get :index, params: { format: 'atom', article_id: article.id } }
        it { expect(response).to be_success }
        it { expect(response).to render_template('index_atom_feed') }
      end
    end

    context 'with rss format' do
      context 'without article' do
        let!(:some) { create(:comment, title: 'some') }
        let!(:items) { create(:comment, title: 'items') }

        before { get 'index', params: { format: 'rss' } }
        it { expect(response).to be_success }
        it { expect(assigns(:comments)).to eq([some, items]) }
        it { expect(response).to render_template('index_rss_feed') }
      end

      context 'with article' do
        let!(:article) { create(:article) }
        before(:each) { get :index, params: { format: 'rss', article_id: article.id } }

        it { expect(response).to be_success }
        it { expect(response).to render_template('index_rss_feed') }
      end
    end
  end
end
