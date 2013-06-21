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
          options[:path]            ||= '/:class/:attachment/:style/:id.:extension'
        end

        # pass things off to paperclip.
        has_attached_file name, options
      end
    end
  end
end