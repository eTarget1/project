class order < ActiveRecord::Base
    belongs_to :food
    belongs_to :user
  end