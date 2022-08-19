# frozen_string_literal: true

module Strategy
  # BaseStrategy class
  class BaseStrategy
    class << self
      def do_algorithm(hash_obj, object, nested_obj_hash)
        objects = []
        if hash_obj.is_a?(Array)
          hash_obj.each { |obj| objects << build_objects(object, obj, nested_obj_hash) }
        else
          objects << build_objects(object, hash_obj, nested_obj_hash)
        end

        objects
      end

      def build_objects(object, hash, nested_obj_hash)
        result = object.new(hash)
        nested_obj_hash.each do |nested_obj|
          build_nested_obj(nested_obj, hash, result)
        end
        result
      end

      def build_nested_obj(nested_obj, hash, result)
        nested_obj.each do |key, value|
          result.instance_variable_set("@#{key}",
                                       value[:delegate_func_name].call(hash[value[:obj_name]]))
        end
      end
    end
  end
end
