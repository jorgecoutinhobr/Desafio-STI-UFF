require 'csv'

module BuscaAluno
	PATH = './tabela/alunos.csv'

	def self.por_matricula(matricula)
		CSV.foreach(PATH, headers: true) do |linha|
			return linha if linha['matricula'] == matricula
		end
	end

	def self.por_nome(nome)
		CSV.foreach(PATH, headers: true) do |linha|
			return linha if linha['nome'] == nome
		end
	end	

	def self.por_uffmail(uffmail)
		CSV.foreach(PATH, headers: true) do |linha|
			return uffmail if linha['uffmail'] == uffmail
		end
	end
end