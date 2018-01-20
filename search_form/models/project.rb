class Project < ActiveRecord::Base
  def self.search(search)
    if search
     #Project.where(['name LIKE ?', "%#{search}%"])
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
     #Project.all
      find(:all)
    end
  end
end

