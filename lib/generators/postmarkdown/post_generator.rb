module Postmarkdown
  class PostGenerator < Rails::Generators::Base
    desc File.read(File.expand_path('../usage/post.txt', __FILE__)).gsub('{{CURRENT_DATE}}', DateTime.now.utc.strftime('%Y-%m-%d-%H%M%S'))
    source_root File.expand_path('../templates', __FILE__)
    argument :slug, :type => :string, :required => true
    class_option :date, :type => :string, :group => :runtime, :desc => 'Publish date for the post'

    def check_slug
      unless slug =~ /^[A-Za-z0-9\-]+$/
        puts 'Invalid slug - valid characters include letters, digits and dashes.'
        exit
      end
    end

    def check_date
      if options.date && options.date !~ /^\d{4}-\d{2}-\d{2}-\d{4}$/
        puts 'Invalid date - please use the following format: YYYY-MM-DD-HHMMSS, eg. 2011-01-01-100000.'
        exit
      end
    end

    def generate_post
      template 'example-post.markdown', "app/posts/#{publish_date}-#{slug.downcase}.markdown"
    end

    private

    def publish_date
      date = options.date.present? ? DateTime.strptime(options.date, '%Y-%m-%d-%H%M%S') : DateTime.now.utc
      date.strftime('%Y-%m-%d-%H%M%S')
    end
  end
end
