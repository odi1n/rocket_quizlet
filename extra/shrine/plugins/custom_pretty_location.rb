require 'shrine/plugins/pretty_location'

class Shrine
  module Plugins
    module CustomPrettyLocation
      def self.configure(uploader, **opts)
        uploader.opts[:custom_pretty_location] ||= { identifier: :id }
        uploader.opts[:custom_pretty_location].merge!(opts)
      end

      module InstanceMethods
        def generate_location(io, **options)
          custom_pretty_location(io, **options)
        end

        def custom_pretty_location(io, name: nil, record: nil, version: nil, derivative: nil, identifier: nil, metadata: {}, **)
          if record
            namespace    = record_namespace(record)
            identifier ||= record_identifier(record)
          end

          basename = basic_location(io, metadata: metadata)
          basename = [*(version || derivative), basename].join("-")

          [*namespace, *identifier, *name, basename].join("/")
        end

        private

        def record_identifier(record)
          id = record.public_send(opts[:custom_pretty_location][:identifier])
          case id
          when Integer
            str_id = "%09d".freeze % id
            str_id.scan(/\d{3}/).join("/".freeze)
          when String
            id.scan(/.{3}/).first(3).join("/".freeze)
          else
            # NOTE: 'raise' cannot be used.  It fails on save.
            nil
          end
        end

        def transform_class_name(class_name)
          if opts[:custom_pretty_location][:class_underscore]
            class_name.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z])([A-Z])/, '\1_\2').downcase
          else
            class_name.downcase
          end
        end

        def record_namespace(record)
          class_name = record.class.name or return
          parts      = transform_class_name(class_name).split("::")

          if separator = opts[:custom_pretty_location][:namespace]
            parts.join(separator)
          else
            parts.last
          end
        end

      end
    end
    register_plugin(:custom_pretty_location, CustomPrettyLocation)
  end
end
