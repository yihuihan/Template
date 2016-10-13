class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :permission

  def permissions_of(entity)
    # byebug
    p=self.permission.where(entity: entity).first
    if p==nil 
      return []
    else
      return p.attributes.keys.select {|key| key[-5..-1]=="_perm" && p.send(key)}
    end
  end

  def set_permissions(entity, permission_list)
    byebug
    p=self.permission.find_by(entity: entity)||self.permission.new {|p| p.entity= entity}

    p.attributes.keys.each do |key|
      # byebug
      if key[-5..-1]=="_perm"
        p.send(key+'=',permission_list.include?(key))
      end
    end

    p.save
  end 

  # def has_permission?(entity, permission)
  #   entity_perm=self.permission.where(entity: entity).first
  #   if  entity_perm!=nil && entity_perm.attributes.keys.include?(permission)
  #     return entity_perm.send(permission)
  #   end 

  #   return false
  # end
  
end
