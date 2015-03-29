module TestFactories

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
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  FactoryGirl.define do
    factory :user do
      email 'test@example.com'
      password 'f4k3p455w0rd'
    end
  end

  def comment_without_email
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, body: "A comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
  end
end