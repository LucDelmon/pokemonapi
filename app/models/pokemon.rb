class Pokemon < ApplicationRecord
  TYPES = %w[Normal Fire Water Grass Flying Fighting Poison Electric Ground
             Rock Psychic Ice Bug Ghost Steel Dragon Dark Fairy].freeze

  validates_presence_of :name, :legendary

  validates :type1, inclusion: { in: TYPES }
  validates :type2, inclusion: { in: TYPES }, allow_nil: true

  validates_numericality_of :number, greater_than: 0, only_integer: true
  validates_numericality_of :total, greater_than: 0, only_integer: true
  validates_numericality_of :hp, greater_than: 0, only_integer: true
  validates_numericality_of :attack, greater_than: 0, only_integer: true
  validates_numericality_of :defense, greater_than: 0, only_integer: true
  validates_numericality_of :sp_attack, greater_than: 0, only_integer: true
  validates_numericality_of :sp_defence, greater_than: 0, only_integer: true
  validates_numericality_of :speed, greater_than: 0, only_integer: true
  validates_numericality_of :generation, greater_than: 0, only_integer: true
end
