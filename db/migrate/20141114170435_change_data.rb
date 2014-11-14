class ChangeData < ActiveRecord::Migration
  def change
    Organization.where('active is NULL').update_all(active: false)
    Organization.all.each do |o|
      if o.name != nil
        o.name = o.name.strip
      end
    end
    Organization.where('name is NULL OR name = ?', '').delete_all

    Person.where('date_of_birth < ?', (Date.today - 100.years)).delete_all
  end
end
