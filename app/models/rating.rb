class Rating < ActiveRecord::Base
  belongs_to :professor

  default_scope -> { order('created_at DESC') }  
  #validate on all attributes
  # must be assigned to a professor.
  validates :professor_id, presence: true
  # rating should be from 1-5
  validates :value, presence: true, inclusion: { in: 1..5 }
  # rating comment should be relatively short. We don't want our users to write a book.
  validates :comment, length: { maximum: 250 }

end
