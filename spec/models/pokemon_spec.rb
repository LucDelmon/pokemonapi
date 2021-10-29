require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:type1).in_array(described_class::TYPES) }
  it { is_expected.to validate_inclusion_of(:type2).in_array(described_class::TYPES).allow_nil }
  it { is_expected.to validate_numericality_of(:number).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:total).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:hp).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:attack).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:defense).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:sp_attack).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:sp_defence).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:speed).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:generation).is_greater_than(0).only_integer }
end
