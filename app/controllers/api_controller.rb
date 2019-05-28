class ApiController < ApplicationController
  def create
    Converter::Proxy.new(params, request.headers["Authorization"]).perform
  end
end
