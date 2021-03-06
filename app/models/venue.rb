class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_venue, use: :slugged

  belongs_to :state
  belongs_to :local_govt_area
  belongs_to :user

  has_many :facilities, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :event_types
  has_many :categories, through: :event_types
  has_many :bookings

  attr_accessor :c_user, :form_step, :email

  accepts_nested_attributes_for :facilities, reject_if: :all_blank, allow_destroy: true

  accepts_attachments_for :images, attachment: :thumbnail
  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => :all_blank

  # validates :name, :state_id, :local_govt_area_id, :address, :phone, :email, :capacity, presence: true

  #Validation rule when user create
  with_options :if => lambda { |o| o.form_step == "alien"} do |step|
    step.validates :name, :about, :state_id, :price, :local_govt_area_id, :address, :email, :capacity, presence: true
    step.validates :phone, presence: true, 
                    numericality: { only_integer: true },
                    length: {minimum: 11}
 
    step.validates_associated :user, if: -> { c_user.nil? }
    step.before_validation :create_user_and_validate, if: -> { c_user.nil? }
  end

  with_options :if => lambda { |o| o.form_step == "user"} do |step|
    step.validates :name, :about, :state_id, :price, :local_govt_area_id, :address, :capacity, presence: true
    step.validates :phone, presence: true, 
                    numericality: { only_integer: true },
                    length: {minimum: 11}

    step.validates_associated :facilities
  end   

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_venue
    [
      :name,
      [:id, :name],
      [:id, :name, :phone],
    ]
  end

  #scoping
  scope :active, -> {where(:status => 'complete')}

  def create_user_and_validate
    if self.form_step == 'alien'#self.new_record?
      user_record = self.build_user
      user_record.is_manager = true
      user_record.email = self.email.blank? ? "" : self.email.to_s
      check_user_errors(user_record)
      return false unless errors.blank?
    end
    self.email = "" if self.email.blank?
    return false unless errors.blank?
  end
  
  def check_user_errors(user)
    unless user.valid?
      user.errors.each{|attr,msg| errors.add(attr.to_sym,"#{msg}")}
    end
    return false unless user.errors.blank?
  end

  def is_incomplete?
    self.status == "uncomplete"
  end

  def self.get_all_bookings
    bookings = []
    self.all.each do |venues|
      venues.bookings.each {|book| bookings.push(book)}
    end
    bookings
  end

  #scoping venues and booking using current_user
  def self.get_venue_bookings(current_user)
    bookings = []
    if !current_user.nil?
      current_user.venues.each do |venue|
        venue.bookings.each {|book| bookings.push(book)}
      end
    end
    bookings
  end

  def get_no_bookings
    self.bookings.count
  end


end
