module Converter
  class Proxy
    attr_accessor :params, :bearer

    def initialize(params, bearer)
      @params = params
      @bearer = bearer
    end

    def perform
      Converter::PointOfInterest.new(params[:point_of_interests], bearer).perform
      Converter::Tour.new(params[:tours], bearer).perform
      Converter::EventRecord.new(params[:events], bearer).perform
    end
  end
end
