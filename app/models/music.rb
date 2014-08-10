class Music < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  validates :album, presence: true
end
