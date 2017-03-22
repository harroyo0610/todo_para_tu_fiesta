class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
	#se utiliaza para tener acceso al atributo antes de salvarlo
	attr_accessor :remember_token, :activation_token, :reset_token
	before_save :downcase_email
	before_create :create_activation_digest
  has_many :reservations
	#before_save {self.email = email.downcase}
	validates :name, presence: true,  length: {maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 225 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6}, allow_nil: true

	#codigo oscuro para hacer una instalacion de usuario para un usuario valido
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(String, cost: cost)
	end	

	#regresa un random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	#recurda al usuario en la base de datos para el uso de sesiones
	def remember 
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	#regresa true si el token coincide con el de la base de datos
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)			
	end

	#olvidar a usuarios
	def forget
		update_attribute(:remember_digest, nil)
	end

	#activates an account
	def activate 
		update_attribute(:activated, true)
		update_attribute(:activated_at, Time.zone.now)
	end

	#sends activation email
	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	#sets the password reset attributes
	def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
  	reset_sent_at < 2.hours.ago
  end	

	private
		#convierte email a minusculas
	def downcase_email
		self.email = email.downcase
	end
	
	#crea y asigan la activacion token and digest.
	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end
end