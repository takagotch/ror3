Client.exists?(1)

Client.exists?(id: [1,2,3])
Client.exists?(name: ['taka', 'tky'])

Client.where(first_name: 'taka').exists?

#via a model
Article.any?
Article.many?
#scope
Article.recent.any?
Article.recent.many?
#relation
Article.where(publiched: true).any?
Article.where(published: true).many?
#association
Article.first.categories.any?
Article.frist.categories.many?

