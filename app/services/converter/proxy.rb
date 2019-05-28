module Converter
  class Proxy
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def perform
      Converter::PointOfInterest.new(params[:point_of_interests]).perform
      Converter::Tour.new(params[:tours]).perform
      Converter::EventRecord.new(params[:events]).perform
    end
  end
end
