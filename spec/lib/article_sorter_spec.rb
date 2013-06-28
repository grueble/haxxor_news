require 'spec_helper'

describe ArticleSorter do
  describe '#initialize and #params' do
    it "assigns the first parameter to params" do
      params = {:sort => 'newest'}
      described_class.new(params).params.should == params
    end
  end
  
  describe '#results' do
    it "returns Articles by creation timestamp by default" do
      Article.should_receive(:by_created_at)
      described_class.new({}).results
    end
    
    it "returns Articles by creation timestamp if sort is newest" do
      Article.should_receive(:by_created_at)
      described_class.new({:sort => 'newest'}).results
    end

    it "returns Articles by rating if sort is rating" do
      Article.should_receive(:by_rating)
      described_class.new({:sort => 'rating'}).results
    end

    context 'sorted by rating' do
      before { Timecop.freeze }
      after { Timecop.return }

      it "returns Articles filtered for the given year" do
        article_scope = double("article_scope")
        article_scope.should_receive(:for_date_range).with(Time.current.all_year)
        Article.stub(:by_rating => article_scope)
        
        params = {:sort => 'rating', :year => Time.current.year}
        
        described_class.new(params).results
      end

      it "returns Articles filtered for the given month" do
        article_scope = double("article_scope")
        article_scope.should_receive(:for_date_range).with(Time.current.all_month)
        Article.stub(:by_rating => article_scope)

        params = {
          :sort  => 'rating',
          :year  => Time.current.year,
          :month => Time.current.month
        }

        described_class.new(params).results
      end

      it "returns Articles filtered for the given day" do
        article_scope = double("article_scope")
        article_scope.should_receive(:for_date_range).with(Time.current.all_day)
        Article.stub(:by_rating => article_scope)
        
        params = {
          :sort  => 'rating',
          :year  => Time.current.year,
          :month => Time.current.month,
          :day   => Time.current.day
        }
        
        described_class.new(params).results
      end
    end
  end
end
