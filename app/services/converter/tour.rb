module Converter
  class Tour < Base
    attr_accessor :entries, :bearer

    def initialize(entries, bearer)
      @entries = entries
      @bearer = bearer
    end

    def perform
      return unless entries.present?

      entries.each do |entry|
        mutation = build_mutation('createTour', entry)
        send_mutation(mutation, bearer)
      end
    end
  end
end
