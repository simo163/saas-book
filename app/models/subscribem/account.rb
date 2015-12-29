module Subscribem
  class Account < ActiveRecord::Base
    EXCLUDED_SUBDOMAINS = %w(admin)

    has_many :members, :class_name => "Subscribem::Member"
    has_many :users, :through => :members
    belongs_to :plan, :class_name => "Subscribem::Plan"
    belongs_to :owner, :class_name => "Subscribem::User"
    accepts_nested_attributes_for :owner

    validates :name, presence: true
    validates :subdomain, :presence => true, :uniqueness => true
    validates_exclusion_of :subdomain, :in => EXCLUDED_SUBDOMAINS,
                           :message => "is not allowed. Please choose another subdomain."
    validates_format_of :subdomain, :with => /\A[\w\-]+\Z/i,
                        :message => "is not allowed. Please choose another subdomain."

    before_validation do
      self.subdomain = subdomain.to_s.downcase
    end

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
    end

    def owner?(user)
      owner == user
    end

  end
end
