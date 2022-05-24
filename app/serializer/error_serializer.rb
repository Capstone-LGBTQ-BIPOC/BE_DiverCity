class ErrorSerializer
  include JSONAPI::Serializer

  def self.api_format(result)
    { error:
      {
        code: "#{result[:error][:code]}",
        description:  "#{result[:error][:description]}"
      },
      status: 404 }
  end
end
