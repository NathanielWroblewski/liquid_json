class Variable < ActiveRecord::Base
  validates :path, presence: true
  validates :name, presence: true
  validates :route_id, presence: true

  validates_uniqueness_of :name, scope: [:path, :route_id]
end
