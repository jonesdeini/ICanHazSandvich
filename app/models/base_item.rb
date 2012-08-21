# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  image       :string(255)
#  defindex    :integer
#  float_value :float
#  created_at  :datetime
#  updated_at  :datetime
#

class BaseItem < ActiveRecord::Base

  set_table_name "items"

  has_many :inventories
  has_many :players, :through => :inventories

  # i wonder which error this would raise if it had 0 params
  def search(json)
    # over ride me bro!
    raise MethodNotImplementedError
  end

end
