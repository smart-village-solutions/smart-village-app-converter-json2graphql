class ApiController < ApplicationController
  def create
    Converter::Proxy.new(params).perform
  end
end
