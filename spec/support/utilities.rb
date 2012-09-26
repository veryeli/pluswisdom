  def full_title(page_title)
    base_title = "is where it is at"
    if page_title.empty?
      "Here #{base_title}"
    else
      "#{page_title} #{base_title}"
    end
  end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end
