class Todo < ApplicationRecord
  belongs_to :users

  enum importances: { low: 0, medium: 1, high: 2 }
end
