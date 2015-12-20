class Role < ActiveRecord::Base

  # has_many :abilities

  has_and_belongs_to_many :users, :join_table => :roles_users
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  # attr_accessible :title, :body
end
