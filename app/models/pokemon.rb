class Pokemon < ApplicationRecord
  VALID_TYPES = %w[Normal Fire Water Electric Grass Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon Dark Steel Fairy].freeze
  INVALID_TYPE_MESSAGE = "%{value} is not a valid type"

  validates :pokemon_number, :name, :type_1, :total, :hp, :attack, :defense, :spe_attack, :spe_defense, :speed, :generation, presence: true, allow_blank: false
  validates :legendary, inclusion: { in: [true, false] }
  validates :type_1, inclusion: { in: VALID_TYPES, message: INVALID_TYPE_MESSAGE }
  validates :type_2, inclusion: { in: VALID_TYPES, message: INVALID_TYPE_MESSAGE }, allow_nil: true
  validates :total, :hp, :attack, :defense, :spe_attack, :spe_defense, :speed, numericality: { only_integer: true }
  validates :total, numericality: { in: 0..510 }
  validates :hp, :attack, :defense, :spe_attack, :spe_defense, :speed, numericality: { in: 0..255 }
end
