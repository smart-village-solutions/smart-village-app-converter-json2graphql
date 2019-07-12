# frozen_string_literal: true

module Converter
  class NewsItem < Base
    attr_accessor :entries, :bearer

    def initialize(entries, bearer)
      @entries = entries
      @bearer = bearer
    end

    def perform
      return unless entries.present?

      if entries.first['action'] == 'destroy'
        mutation_name = 'destroyRecord(recordType: "NewsItem", ' + "externalId:#{entries.first[:external_id]})"
        build_and_send_mutations_for_entries(mutation_name)
      else
        build_and_send_mutations_for_entries('createNewsItem')
      end
    end

    private

    def build_and_send_mutations_for_entries(mutation_name)
      entries.each do |entry|
        mutation = build_mutation(mutation_name, entry)
        send_mutation(mutation, bearer)
      end
    end
  end
end
