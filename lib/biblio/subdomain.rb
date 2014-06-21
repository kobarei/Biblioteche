module Biblio
  module Subdomain
    def subdomained_login_id(request, login_id)
      "#{request.subdomain}-#{login_id}"
    end

    def non_subdomained_login_id(request, login_id)
      login_id.gsub(/\A#{request.subdomain}-/, '')
    end
  end
end
