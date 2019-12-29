require "../translator"

class SignInUser < Avram::Operation
  param_key :user
  # You can modify this in src/operations/mixins/user_from_email.cr
  include UserFromEmail
  include Translator

  # quick_def current_user, nil
  quick_def user_lang, LANGUAGE_DEFAULT

  attribute email : String
  attribute password : String

  # Run validations and yields the operation and the user if valid
  def submit
    user = user_from_email
    validate_credentials(user)

    if valid?
      yield self, user
    else
      yield self, nil
    end
  end

  # `validate_credentials` determines if a user can sign in.
  #
  # If desired, you can add additional checks in this method, e.g.
  #
  #    if user.locked?
  #      email.add_error t("error.locked_out")
  #    end
  private def validate_credentials(user)
    if user
      unless Authentic.correct_password?(user, password.value.to_s)
        password.add_error t("error.auth_incorrect")
      end
    else
      # Usually ok to say that an email is not in the system:
      # https://kev.inburke.com/kevin/invalid-username-or-password-useless/
      # https://github.com/luckyframework/lucky_cli/issues/192
      email.add_error t("error.not_in_system")
    end
  end
end
