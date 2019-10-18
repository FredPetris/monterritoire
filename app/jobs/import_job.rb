class ImportJob < ApplicationJob
  require 'csv'
  queue_as :default

  def perform(ftp_file)
    csv_file = Rails.root.join('spec/fixtures/epcicom.csv')
    siren_prev = nil
    report = []

    CSV.foreach(csv_file, { headers: true, header_converters: :symbol, col_sep: ';', encoding: 'ISO-8859-1' }) do |row|
      if row[:siren_epci] != siren_prev && !Intercommunality.where(siren: row[:siren_epci]).exists?
        begin
          form = row[:form_epci] === 'METRO' ? 'met' : row[:form_epci].downcase
          @intercommunality = Intercommunality.create!(siren: row[:siren_epci], name: row[:nom_complet], form: form)
          siren_prev = row[:siren_epci]
        rescue ActiveRecord::RecordInvalid => e
          report << "ERROR create Intercommunality | #{row[:siren_epci]} | #{e}"
        end
      end
      if !Commune.where(name: row[:nom_com]).exists?
        @intercommunality.communes.create!(name: row[:nom_com], code_insee: row[:insee], population: row[:pop_total] )
      end
    end

    report.each do |line|
      puts line
    end
  end
end
