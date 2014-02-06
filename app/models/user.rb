class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subordinates, :class_name => "User"
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :role
  has_many :leaves
  has_many :leaves_to_approve, :class_name => "Leave", :foreign_key => "manager_id"
  validates :email, :first_name, :manager_id, :role_id, :presence => true
  has_many :salaries, :order => "created_at desc", :dependent => :destroy
  has_many :payrolls, :order => "created_at desc", :dependent => :destroy
  mount_uploader :image, ImageUploader
  
  def is_admin?
    self.role.name.downcase == "admin" if self.role_id
  end

  def is_manager?
    self.role.name.downcase == "manager" if self.role_id
  end
  def is_employee?
    self.role.name.downcase == "employee" if self.role_id
  end
  
  def name
  	return [self.first_name, self.middle_name, self.last_name].join(' ')
  end

  def salary
  	return self.salaries.first
  end

  def name
  	return [self.first_name, self.middle_name, self.last_name].join(' ')
  end

  def reporting_manager
    self.manager.present? ? manager.name : ''
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end


end
