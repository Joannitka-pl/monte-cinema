# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'cinema@monte.com'
  layout 'mailer'
end
