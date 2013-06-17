require 'spec_helper'

describe ArticlesController do
  let!(:article) { Article.create(:title => "Title", :link => "http://www.example.com") }
  
  describe 'GET #new' do
    before { get :new }
    
    it { should respond_with(:success) }
    it { should render_template(:new) }

    it "assigns to @article" do
      assigns(:article).should_not be_nil
    end
  end
  
  describe 'GET #show' do
    before { get :show, :id => article.id }
      
    it { should respond_with(:success) }
    it { should render_template(:show) }
    
    it "assigns to @article" do
      assigns(:article).should_not be_nil
    end
  end
  
  describe 'POST #create' do
    context "with invalid data" do
      describe "the request" do
        before { post :create, :article => { :title => "", :link => ""}  }

        it { should respond_with(:success) }
        it { should render_template(:new) }
      end

      it "does not create a new record" do
        expect { 
          post :create, :article => { :title => "", :link => ""} 
        }.to_not change{ Article.count }
      end
    end

    context "with valid data" do
      describe "the request" do
        before { post :create, :article => { :title => "Title", :link => "http://www.example.com"}}
        
        it { should respond_with(:redirect) }
        it { should redirect_to(article_url(assigns(:article).id)) }
      end

      it "creates a new record" do
        expect { 
          post :create, :article => { :title => "Title", :link => "http://www.example.com"} 
        }.to change{ Article.count }.by(1)
      end
    end
  end
end
