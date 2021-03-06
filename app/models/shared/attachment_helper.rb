module Shared
  module AttachmentHelper

    class << self
      def included(base)
        base.extend ClassMethods
      end
    end

    module ClassMethods
      def has_attachment(name, options = {})

        if Rails.env.production?
          options[:storage]         ||= :s3
          options[:url]             ||= ':s3_alias_url'
          options[:s3_credentials]  ||= File.join(Rails.root, 'config', 'aws_s3.yml')
          options[:s3_host_alias]   ||= 's3-sa-east-1.amazonaws.com/controlaprojetos'
          options[:bucket]          ||= 'controlaprojetos'
          #options[:s3_permissions]  ||= 'private'
          #options[:s3_protocol]     ||= 'https'
          unless options.include?(:path)
            options[:path] ||= '/:class/:attachment/:id_:style.:extension'
          end
        else
          unless options.include?(:url) && options.include?(:path)
            options[:url]  ||= '/system/:rails_env/:class/:attachment/:id_:style.:extension'
            options[:path] ||= ':rails_root/public/system/:rails_env/:class/:attachment/:id_:style.:extension'
          end
        end

        # pass things off to paperclip.
        has_attached_file name, options
      end
    end
  end
end