class Pet < ApplicationRecord
  validates :name,
    presence: true

  validates :image,
    presence: true

  validates :age,
    presence: true

  validates :sex,
    presence: true

  validates :adoption_status,
    presence: true,
    inclusion: { in: ['adoptable', 'pending'] }

  belongs_to :shelter

  def is_adoptable?
    adoption_status == 'adoptable'
  end
end
