require 'dm-core'
require 'dm-validations'
require 'dm-migrations'

DataMapper.setup(:default, 'mysql://localhost/machinist?user=root&password=')

module DataMapperEnvironment
  class User
    include DataMapper::Resource

    property :id,       Serial
    property :username, String, :required => true, :unique => true
  end

  class Post
    include DataMapper::Resource

    property :id,       Serial
    property :title,    String
    property :body,     Text

    belongs_to :author, 'User', :required => false
    has n, :comments
    has n, :tags, :through => Resource
  end

  class Comment
    include DataMapper::Resource

    property :id,       Serial
    property :body,     Text

    belongs_to :post, :required => false
  end

  class Tag
    include DataMapper::Resource

    property :id,       Serial
    property :name,     String

    has n, :posts, :through => Resource
  end

  def self.empty_database!
    [User, Post, Comment, Tag].each do |model|
      model.destroy
      model.clear_blueprints!
    end
  end
end

DataMapper.finalize
DataMapper.auto_migrate!
