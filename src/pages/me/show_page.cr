class Me::ShowPage < MainLayout
  # needs translator : Translator
  def content
    h1 @translator.t("me.profile")
    h3 "#{@translator.t("me.email")}:  #{@current_user.email}"

    helpful_tips
  end

  private def helpful_tips
    h3 "#{@translator.t("me.next")}:"
    ul do
      li { link_to_authentication_guides }
      li "#{@translator.t("me.modify_page")}: src/pages/me/show_page.cr"
      li "#{@translator.t("me.after_signin")}: src/actions/home/index.cr"
    end
  end

  private def link_to_authentication_guides
    link @translator.t("me.auth_guides"),
      to: "https://luckyframework.org/guides/authentication"
  end
end
