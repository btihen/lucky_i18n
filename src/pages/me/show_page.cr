class Me::ShowPage < MainLayout
  def content
    h1 t("user.profile")
    h3 "#{t("user.email")}: #{@current_user.email}"
    helpful_tips
  end

  private def helpful_tips
    h3 "#{t("user.next")}:"
    ul do
      li { link_to_authentication_guides }
      li "#{t("user.modify_page")}: src/pages/me/show_page.cr"
      li "#{t("user.after_signin")}: src/actions/home/index.cr"
    end
  end

  private def link_to_authentication_guides
    link t("user.auth_guides"),
      to: "https://luckyframework.org/guides/authentication"
  end
end
