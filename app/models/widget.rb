class Widget < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :widget_status

  before_validation do
    self.name = nil if name.blank?
  end

  class HighEnoughForLegacyManufacturersValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.blank?

      return unless value < 100_00 && record.manufacturer.created_at.year < 2010

      record.errors.add(attribute, 'must be < $100 for legacy manufacturers')
    end
  end

  validates :name, {
    presence: true,
    length: { minimum: 5 }
  }
  validates :manufacturer_id, { presence: true }
  validates :price_cents,
            numericality: {
              less_than_or_equal_to: 10_000_00,
              greater_than: 0
            },
            high_enough_for_legacy_manufacturers: true

  def user_facing_identifier
    id_as_string = id.to_s
    return id_as_string if id_as_string.length < 3

    format('%<first>s.%<last_two>s', first: id_as_string[..-3], last_two: id_as_string[-2..])
  end
end
