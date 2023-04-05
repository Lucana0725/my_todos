class Todo < ApplicationRecord
  belongs_to :user  # 親モデルUser(1:Nの1)に紐づくので単数形

  enum importance: { low: 0, medium: 1, high: 2 }
end
