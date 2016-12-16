# encoding: utf-8

class Utility
  class << self
    # as_json convert nil to ""
    def as_json(origin_hash = {})
      origin_hash.inject({}) do |new_hash, (k,v)|
        unless v.nil?
          new_hash[k] = v.class.eql?(Hash) ? as_json(v) : v
        else
          new_hash[k] = ""
        end
        new_hash
      end
    end

    # method such as 'Hash#deep_transform_keys'
    # Utility.deep_transform_values({a: 1, b: {c: nil, d: 1}, e: nil}) {|v| "#{v}"}
    def deep_transform_values(origin_hash = {}, &proc)
      if origin_hash and block_given?
        origin_hash.inject({}) do |new_hash, (k,v)|
          if v.class.eql?(Hash)
            new_hash[k] = self.send(:deep_transform_values, v, &proc)
          else
            #new_hash[k] = yield v
            new_hash[k] = proc.call(v)
          end
          new_hash
        end
      else
        origin_hash
      end
    end

    def as_json_nil_to_string(origin_hash = {})
      deep_transform_values(origin_hash) {|v| v.nil? ? "" : v }
    end

    def add_params_to_url(url, path, params)
      if url.present? and params.present?
        uri = URI(url)
        query_hash = Rack::Utils.parse_query(uri.query)
        query_hash.merge!(params)
        #uri.query = Rack::Utils.build_query(query_hash) #cannot use to nest_hash
        uri.query = query_hash.to_param
        uri.path = path
        uri.to_s
      end
    end

    # return an hash include version regex string to match older version
    def old_version_regexs(version)
      if version.present?
        version_list = version.split('.').collect{|v| v.to_i}
        version_regexs = {}

        #major_regex
        version_regexs.merge!(major_regex: "^#{less_number_regex(version_list[0])}\\.") if version_list[0] > 0
        #minor_regex
        version_regexs.merge!(minor_regex: "^#{version_list[0]}\\.#{less_number_regex(version_list[1])}\\.") if version_list[1] > 0
        # build_regex
        version_regexs.merge!(build_regex: "^#{version_list[0]}\\.#{version_list[1]}\\.#{less_number_regex(version_list[2])}") if version_list[2] > 0
        version_regexs
      end
    end

    def new_version_regexs(version)
    end

    # is version old than match_version? return true or false
    def is_old_version?(version, match_version)
      if version.present? and match_version.present?
        version_match_regex = old_version_regexs(match_version).values.join("|")
        (version.match /#{version_match_regex}/).present?
      end
    end

  end
end
