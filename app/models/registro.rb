class Registro < ApplicationRecord
  validates :nombre, presence: true
  validates :correo, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
