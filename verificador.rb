module Verificador
  def self.inativo?(status)
	  status.downcase == 'inativo'
	end 

  def self.possui_uffmail?(uffmail)
    uffmail
  end  
end