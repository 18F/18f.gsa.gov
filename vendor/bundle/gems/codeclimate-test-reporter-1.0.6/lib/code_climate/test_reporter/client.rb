require "json"
require "uri"
require "net/https"

module CodeClimate
  module TestReporter
    class Client
      DEFAULT_TIMEOUT = 5 # in seconds
      USER_AGENT = "Code Climate (Ruby Test Reporter v#{CodeClimate::TestReporter::VERSION})".freeze

      def host
        ENV["CODECLIMATE_API_HOST"] ||
          "https://codeclimate.com"
      end

      # N.B. Not a generalized solution for posting multiple results
      # N.B. Only works with in tandem with additional communication from
      # Solano.
      def batch_post_results(files)
        uri = URI.parse("#{host}/test_reports/batch")
        http = http_client(uri)

        boundary = SecureRandom.uuid
        post_body = []
        post_body << "--#{boundary}\r\n"
        post_body << "Content-Disposition: form-data; name=\"repo_token\"\r\n"
        post_body << "\r\n"
        post_body << ENV["CODECLIMATE_REPO_TOKEN"]
        files.each_with_index do |file, index|
          post_body << "\r\n--#{boundary}\r\n"
          post_body << "Content-Disposition: form-data; name=\"coverage_reports[#{index}]\"; filename=\"#{File.basename(file)}\"\r\n"
          post_body << "Content-Type: application/json\r\n"
          post_body << "\r\n"
          post_body << File.read(file)
        end
        post_body << "\r\n--#{boundary}--\r\n"
        request = Net::HTTP::Post.new(uri.request_uri)
        request["User-Agent"] = USER_AGENT
        request.body = post_body.join
        request["Content-Type"] = "multipart/form-data, boundary=#{boundary}"
        response = http.request(request)

        if response.code.to_i >= 200 && response.code.to_i < 300
          response
        else
          raise "HTTP Error: #{response.code}"
        end
      end

      def post_results(result)
        uri = URI.parse("#{host}/test_reports")
        http = http_client(uri)

        request = Net::HTTP::Post.new(uri.path)
        request["User-Agent"] = USER_AGENT
        request["Content-Type"] = "application/json"

        if CodeClimate::TestReporter.configuration.gzip_request
          request["Content-Encoding"] = "gzip"
          request.body = compress(result.to_json)
        else
          request.body = result.to_json
        end

        response = http.request(request)

        if response.code.to_i >= 200 && response.code.to_i < 300
          response
        else
          raise "HTTP Error: #{response.code}"
        end
      end

      private

      def http_client(uri)
        Net::HTTP.new(uri.host, uri.port).tap do |http|
          if uri.scheme == "https"
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_PEER
            http.ca_file = ca_file
            http.verify_depth = 5
          end
          http.open_timeout = CodeClimate::TestReporter.configuration.timeout
          http.read_timeout = CodeClimate::TestReporter.configuration.timeout
        end
      end

      def compress(str)
        sio = StringIO.new("w")
        gz = Zlib::GzipWriter.new(sio)
        gz.write(str)
        gz.close
        sio.string
      end

      def ca_file
        ENV["SSL_CERT_FILE"] ||
          File.expand_path("../../../../config/cacert.pem", __FILE__)
      end
    end
  end
end
