# frozen_string_literal: true

##
# Ruby library for interacting with Bovisync API
# @see https://bovisync.farm/apidoc/v1/
# @todo Open source
#
class Bovisync
  attr_accessor :client

  def initialize
    # Initiation client
    @client = Faraday.new(url: 'https://bovisync.farm') do |builder|
      builder.authorization :Bearer, authentication[:access_token]
      builder.request :curl, Logger.new($stdout), :warn if Rails.env.development?
      builder.request :retry
      builder.options[:params_encoder] = Faraday::FlatParamsEncoder
      builder.response :logger if Rails.env.development?
      builder.response :json, content_type: /\bjson$/
      builder.response :json, parser_options: { symbolize_names: true }
      builder.adapter Faraday.default_adapter
    end
    # Set session herds
    herd_ids = herds.pluck(:id)
    session_herd({ located: herd_ids })
  end

  def authentication
    client_id = Rails.application.credentials.dig(:bovisync, :client_id)
    client_secret = Rails.application.credentials.dig(:bovisync, :client_secret)
    connection = Faraday.new(url: 'https://bovisync.farm') do |builder|
      builder.basic_auth client_id, client_secret
      builder.request  :curl, Logger.new($stdout), :warn if Rails.env.development?
      builder.request  :retry
      builder.response :logger if Rails.env.development?
      builder.response :json, content_type: /\bjson$/
      builder.response :json, parser_options: { symbolize_names: true }
      builder.adapter Faraday.default_adapter
    end

    response = connection.post('/api/auth/token', {
      grant_type: 'client_credentials',
    }.to_query)
    response.body
  end

  def herds(options = {})
    response = client.get('/api/user/herds/', options)
    response.body
  end

  def session_herd(options = {})
    response = client.post('/api/session/herd/', options.to_json)
    response.body
  end

  def animal_list(options = {})
    response = client.get('/api/animal/list/', options)
    response.body
  end

  def report(options = {})
    response = client.get('/api/report/animal/data', options)
    response.body
  end
end
