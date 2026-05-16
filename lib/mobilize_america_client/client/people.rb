module MobilizeAmericaClient
  class Client
    module People
      def organization_people(organization_id:, updated_since: nil, cursor: nil, page: nil, per_page: nil)
        params = {}

        unless updated_since.nil?
          params[:updated_since] = updated_since.to_i
        end

        unless cursor.nil?
          params[:cursor] = cursor
        end

        unless page.nil?
          params[:page] = page
        end

        unless per_page.nil?
          params[:per_page] = per_page
        end

        get(path: "/organizations/#{esc(organization_id)}/people", params: params)
      end
    end
  end
end
