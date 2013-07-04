class Admin < ActiveRecord::Base
  # removed registerable; anyone can register as admin if this is left here.
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
