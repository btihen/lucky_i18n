require "../translator"

abstract class AuthLayout
  include Translator
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # we don't have a current_user (yet) - so we set user_lang to the default language
  # TODO: figure out how to get JS on Frontend to influence login language choice
  quick_def user_lang, LANGUAGE_DEFAULT

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
        content
      end
    end
  end
end
