module ApplicationHelper
  def user_avatar(user, size=40)
      if user.avatar.attached?
        user.avatar.variant(resize: "#{size}x#{size}!")
      else
        gravatar_image_url(user.email, size: size)
      end
  end

  def humanized_date(date)
    date.strftime("%B %d, %Y")
  end
end
