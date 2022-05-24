class ErrorSerializer
  include JSONAPI::Serializer

  def self.api_format(result)
    { error:
      {
        code: (result[:error][:code]).to_s,
        description: (result[:error][:description]).to_s
      } }
  end
end
