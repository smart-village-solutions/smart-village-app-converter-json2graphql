module Converter
  class EventRecord < Base
    attr_accessor :entries

    def initialize(entries)
      @entries = entries
    end

    def perform
      return unless entries.present?

      entries.each do |entry|
        mutation = build_mutation('createEventRecord', entry)
        send_mutation(mutation)
      end
    end
  end
end
