class SignUps::NewPage < AuthLayout
  include Lucky::SelectHelpers
  needs operation : SignUpUser

  def content
    h1 t("auth.sign_up")
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit t("auth.sign_up"), flow_id: "sign-up-button"
    end
    link t("auth.sign_in"), to: SignIns::New
  end

  private def sign_up_fields(op)
    # the dropdown selector for the languages
    label_for op.lang, t("user.preferred_language")
    select_input(op.lang) do
      options_for_select(op.lang, LANGUAGES_SELECTOR_LIST)
    end
    # end of the dropdown for the languages

    mount Shared::Field.new(op.email), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password), &.password_input
    mount Shared::Field.new(op.password_confirmation), &.password_input
  end
end
