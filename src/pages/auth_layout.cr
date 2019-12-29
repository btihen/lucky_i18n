abstract class AuthLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  needs translator : Translator

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    I18n.t("default.page_title", @translator.lang)
  end

  def render
    html_doctype

    html lang: @translator.lang do
      mount Shared::LayoutHead.new(page_title: page_title, context: @context)

      body do
        mount Shared::FlashMessages.new(@context.flash)
        content
      end
    end
  end
end
