actions :create
default_action :create

attribute :username, :kind_of => String, :name_attribute => true
attribute :passwd,   :kind_of => String, :name_attribute => false

def initialize(*args)
  super
  @action = :create
end
