class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  enum role: { user: "user", teacher: "teacher", admin: "admin" }, _suffix: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def default_redirect_path
    if admin_role?
      Rails.application.routes.url_helpers.admin_dashboard_path
    elsif teacher_role?
      Rails.application.routes.url_helpers.teacher_dashboard_path
    else
      Rails.application.routes.url_helpers.root_path
    end
  end
end
