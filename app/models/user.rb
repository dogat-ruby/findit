class User
  include Mongoid::Document
  include Mongoid::Timestamps
  embeds_many :locations , validate: false

  ## Database authenticatable
  #field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ## Database authenticatable
  #field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  include Mongoid::Timestamps
  #syntax for sending the admin mailer
  private
  def notify_admin
    AdminMailer.notify_new(self).deliver 
  end


  field :username, type: String
  field :password, type: String
  field :email, type: String
  field :phone, type: Integer
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: DateTime


  #before_save :clean_up_username

  #scope :dogatuncay, -> { where username: 'DogaTuncay'}
  #scope :usernames, -> { pluck  :username}

  index({username: 1}, {unique: true, name: "username_index"})

  #validates :username, presence: true, length: {minimum: 6, maximum: 15}
  #validates :password, presence: true, length: {minimum: 6, maximum: 10}
  #validates :phone, numericality: {only_integer: true}
  #validates_email_format_of :email => { :message => 'Please enter a valid e-mail'}
  #validates_with :custom


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


  def clean_up_username
  	if self.username == "administrator"
  	   self.username == rand(36**8).to_s(36)
  	end
  end

end
