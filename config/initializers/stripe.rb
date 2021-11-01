# Stripe.api_key = Rails.application.credentials[:stripe][:secret]
if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
  Stripe.api_key = Rails.application.credentials[:stripe][:secret]
end