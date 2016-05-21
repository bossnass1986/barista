Geocoder.configure(
  # geocoding options
  :timeout      => 30,           # geocoding service timeout (secs)
  # :lookup       => :nominatim,     # name of geocoding service (symbol)
  # :language     => :en,         # ISO-639 language code
  # :use_https    => false,       # use HTTPS for lookup requests? (if supported)
  # :http_proxy   => nil,         # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,         # HTTPS proxy server (user:pass@host:port)
  # :api_key      => nil,         # API key for geocoding service
  # :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],

  # calculation options
  :units     => :km,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear


  # Provide a hardcoded ip of 1.2.3.4 when in developmnt/test and the ip address resolves as localhos

)

if %w(development test).include? Rails.env
  module Geocoder
    module Request
      def geocoder_spoofable_ip_with_localhost_override
        ip_candidate = geocoder_spoofable_ip_without_localhost_override
        if ip_candidate == '127.0.0.1'
          '101.176.89.129'
        else
          ip_candidate
        end
      end
      alias_method_chain :geocoder_spoofable_ip, :localhost_override
    end
  end
end
