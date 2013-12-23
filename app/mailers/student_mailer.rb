class StudentMailer < ActionMailer::Base
  default from: "applications@nairobidevschool.org"

  def application_confirmed(student)
    @attendee = student
    mail to: @attendee.email
  end
end
