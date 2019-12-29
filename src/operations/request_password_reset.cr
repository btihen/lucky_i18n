require "../translator"

class RequestPasswordReset < Avram::Operation
  # You can modify this in src/operations/mixins/user_from_email.cr
  include UserFromEmail
  include Translator

  attribute email : String

  # Run validations and yield the operation and the user if valid
  def submit
    user = user_from_email
    validate(user)

    if valid?
      yield self, user
    else
      yield self, nil
    end
  end

  def validate(user : User?)
    validate_required email
    if user.nil?
      email.add_error t("error.not_in_system")
    end
  end
end
