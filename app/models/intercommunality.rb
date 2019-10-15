class Intercommunality < ApplicationRecord
  has_many :communes 

  validates :name, presence: true
  validates :siren, presence: true, uniqueness: {case_sensitive: false}, length: { is: 9 }
  validates :form, inclusion: { in: (%w(ca cu cc met)), case_sensitive: false }

  before_save :set_slug

  def communes_hash
    communes_hash = {}
    communes.each do |commune|
      communes_hash[commune.code_insee] = commune.name
    end
    communes_hash
  end

  def set_slug
    self.slug = name.parameterize if !name.nil? && self.slug.nil?
  end

  def sum_population(population)
    self.population += population
    self.save
  end
end
