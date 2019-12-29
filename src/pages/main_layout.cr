# require "../translator"

abstract class MainLayout
  include Translator
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User
  
  # we also have to make @current_user available as current_user
  quick_def current_user, @current_user

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    t("default.page_title")
  end

  def render
    html_doctype

    html lang: user_lang do
      mount Shared::LayoutHead.new(page_title: page_title, context: @context)

      body do
        mount Shared::FlashMessages.new(@context.flash)
        render_signed_in_user
        content
      end
    end
  end

  private def render_signed_in_user
    text @current_user.email
    text " - "
    link t("auth.sign_in"), to: SignIns::Delete, flow_id: "sign-out-button"
  end
end
