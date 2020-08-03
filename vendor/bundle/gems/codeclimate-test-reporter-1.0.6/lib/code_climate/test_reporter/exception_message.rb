module CodeClimate
  module TestReporter
    class WebMockMessage
      def library_name
        "WebMock"
      end

      def instructions
        <<-STR
  WebMock.disable_net_connect!(:allow => "codeclimate.com")
        STR
      end
    end

    class VCRMessage
      def library_name
        "VCR"
      end

      def instructions
        <<-STR
  VCR.configure do |config|
    # your existing configuration
    config.ignore_hosts 'codeclimate.com'
  end
        STR
      end
    end

    class ExceptionMessage
      HTTP_STUBBING_MESSAGES = {
        "VCR::Errors::UnhandledHTTPRequestError".freeze => VCRMessage,
        "WebMock::NetConnectNotAllowedError".freeze => WebMockMessage,
      }.freeze

      def initialize(exception)
        @exception = exception
      end

      def message
        parts = []
        parts << "Code Climate encountered an exception: #{exception_class}"
        if http_stubbing_exception
          message = http_stubbing_exception.new
          parts << "======"
          parts << "Hey! Looks like you are using #{message.library_name}, which will prevent the codeclimate-test-reporter from reporting results to codeclimate.com.
Add the following to your spec or test helper to ensure codeclimate-test-reporter can post coverage results:"
          parts << "\n" + message.instructions + "\n"
          parts << "======"
          parts << "If this doesn't work, please consult https://codeclimate.com/docs#test-coverage-troubleshooting"
          parts << "======"
        else
          parts << @exception.message
          @exception.backtrace.each do |line|
            parts << line
          end
        end
        parts.join("\n")
      end

      private

      def exception_class
        @exception.class.to_s
      end

      def http_stubbing_exception
        HTTP_STUBBING_MESSAGES[exception_class]
      end
    end
  end
end
