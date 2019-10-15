class Commune < ApplicationRecord
  belongs_to :intercommunality
  has_many :streets

  validates :name, presence: true
  validates :code_insee, presence: true, length: { is: 5 }

  after_save :sum_population

  def self.search(search)
    research = search.mb_chars.downcase
    Commune.where("lower(name) LIKE ?", "%#{sanitize_sql_like(research)}%") 
  end
  
  def self.to_hash
    communes_hash = {}
    Commune.all.each do |commune|
      communes_hash[commune.code_insee] = commune.name
    end
    communes_hash
  end

  def sum_population
    if self.intercommunality.present? && self.population.present?
      self.intercommunality.sum_population(population)  
    end                       
  end

end
