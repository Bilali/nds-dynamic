class User < ActiveRecord::Base
  rolify
  # removed registerable; anyone can register as admin if this is left here.
  devise :database_authenticatable,
  :recoverable, :rememberable, :trackable, :validatable

  def admin?
    has_role? :admin
  end
  
end
