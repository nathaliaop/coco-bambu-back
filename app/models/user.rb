class User < ApplicationRecord
    has_secure_password
  
    #Validação de novo usuário
    #Confere se o usuário cadastrou um nome e um email único e válido
    #Confere se a senha do usuário tem pelo menos 8 caracteres
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,
              length: { minimum: 8 },
              if: -> { new_record? || !password.nil? }
  end