require 'spec_helper'
require 'factory_girl_rails'

describe VideosController do

  describe "GET #index json" do
    let!(:video) {FactoryGirl.create(:video)}
    it 'should assign all videos' do
      get :index, format: :json
      assigns(:videos).should eq([video])
    end
  end

  describe "GET #show json" do
    let!(:video) {FactoryGirl.create(:video)}
    it 'should assign correct video to show' do
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

  describe "PUT update json" do
    let!(:video) {FactoryGirl.create(:video)}
    it "should update attributes" do
      video_p = FactoryGirl.attributes_for(:video, title: 'Star Wars')
      expect{
        put :update, id: video, video: video_p, format: :json
        video.reload
      }.to change(video, :title).from('Pump Up Jam1').to('Star Wars')
    end
  end

end

