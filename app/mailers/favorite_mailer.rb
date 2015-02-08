class FavoriteMailer < ActionMailer::Base
  default from: "damien.b.engelhardt@gmail.com"

  def  new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@have-you-reddit.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@have-you-reddit.com>"
    headers["References"] = "<post/#{post.id}@have-you-reddit>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
