class EwoksController < ApplicationController
  api :GET, '/ewoks'
  param :n, :number
  def index
    @ewoks = %w(wicket chirpa logray teebo paploo nicki).map { |name| OpenStruct.new(name: name)}
    n = params[:n].to_i
    @ewoks = @ewoks.take(n) if n > 0
  end
end
