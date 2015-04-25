require 'rails_helper'

describe Vote do

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v = Vote.new(value: 1)
        expect(v).to be_valid
        
        v2 = Vote.new(value: 2)
        expect(v2).not_to be_valid
        
        v3 = Vote.new(value: -1)
        expect(v3).to be_valid
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = create(:post)
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end

  def associated_post(options={})
    post_options = {
      title: 'Post title',
      body: 'Post bodies must be pretty long',
      user: authenticated_user,
      topic: Topic.create(name: 'Topic name')
      }.merge(options)
    Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {
      email: "email#{rand}@fake.com", 
      password: 'password'
      }.merge(options)
    user = create(:user)
    user.skip_confirmation!
    user.save
    user
  end

end