require 'spec_helper'
require 'factory_girl_rails'

describe VideosController do
  describe "GET #index json" do
    it 'should assign all videos' do
      video = FactoryGirl.create(:video)
      get :index, format: :json
      assigns(:videos).should eq([video])
    end
  end

  describe "GET #show json" do
    it 'should assign correct video to show' do
      video = FactoryGirl.create(:video)
      get :show, id: video, format: :json
      assigns(:video).should eq(video)
    end
  end

  describe "POST create json" do
    context "with valid attributes" do
      it "creates a new video" do
        expect{
          post :create, video: FactoryGirl.attributes_for(:video), format: :json
        }.to change(Video, :count).by(1)
      end
    end
  end

end