class Aluno
  attr_accessor :nome, :matricula, :telefone, :email, :uffmail, :status, :primeiro_nome, :sobrenome

  def initialize(aluno)
		@nome = aluno['nome']
		@primeiro_nome = nome.split(' ')[0]
		@sobrenome = nome.split(' ')[1]
		@matricula = aluno['matricula']
		@telefone = aluno['telefone']
		@email = aluno['email']
		@uffmail = aluno['uffmail']
		@status = aluno['status']
  end

	def inativo?
	  status.downcase == 'inativo'
	end
end